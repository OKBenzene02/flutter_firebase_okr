import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_posts/features/authentication/presentation/bloc/auth_bloc_bloc.dart';
import 'package:instagram_posts/features/dashboard/data/models/posts_models.dart';

class DashboardServices {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firebaseFirestore;

  DashboardServices({
    required FirebaseAuth auth,
    required FirebaseFirestore firebaseFirestore,
  }) : _auth = auth,
       _firebaseFirestore = firebaseFirestore;

  Stream<List<PostsModels>> getPosts() {
    final currUser = SessionManager.getUser();
    if (currUser == null) return Stream.error('User not logged in');

    return _firebaseFirestore
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .asyncMap((snapshot) async {
          final List<PostsModels> posts = [];

          for (final doc in snapshot.docs) {
            final data = doc.data();
            final String? userId = data['userId'];
            if (userId == null) continue;

            final userSnapshot = await _firebaseFirestore
                .collection('users')
                .doc(userId) // ← fetch user by userId string
                .get();

            if (!userSnapshot.exists) continue;
            final userData = {
              ...userSnapshot.data() as Map<String, dynamic>,
              'userId': userId,
            };
            final postData = {...data, 'postId': doc.id, 'user': userData};
            posts.add(PostsModels.fromJson(postData));
          }

          return posts;
        });
  }
}
