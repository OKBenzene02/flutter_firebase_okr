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

  Stream<List<PostsModels>?> getPosts() async* {
    final currUser = SessionManager.getUser();
    if (currUser == null) {
      yield null;
      return;
    }

    yield* _firebaseFirestore
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .asyncMap((snapshot) async {
          List<PostsModels> posts = [];

          for (final doc in snapshot.docs) {
            final docs = doc.data();
            final DocumentReference userRef = docs['user'];
            final userSnapshot = await userRef.get();

            final postData = {...docs, 'user': userSnapshot.data()};

            final post = PostsModels.fromJson(postData);
            posts.add(post);
          }

          posts;
        });
  }
}
