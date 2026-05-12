import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_posts/features/authentication/domain/entities/user_entity.dart';
import 'package:instagram_posts/features/dashboard/domain/entities/posts_entity.dart';

class PostsModels extends PostsEntity {
  PostsModels({
    super.user,
    super.caption,
    super.commentsCount,
    super.createdAt,
    super.isLiked,
    super.likesCount,
    super.postId,
    super.postImages,
  });

  factory PostsModels.fromJson(Map<String, dynamic>? map) {
    return PostsModels(
      user: map?['user'] != null ? UserEntity.fromJson(map?['user']) : null,
      caption: map?['caption'],
      commentsCount: map?['commentsCount'] ?? 0,
      createdAt: map?['createdAt'] != null
          ? (map?['createdAt'] as Timestamp).toDate()
          : null,
      isLiked: map?['isLiked'] ?? false,
      likesCount: map?['likesCount'] ?? 0,
      postId: map?['postId'],
      postImages: map?['postImages'] != null
          ? List<String>.from(map?['postImages'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'caption': caption,
      'commentsCount': commentsCount,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
      'isLiked': isLiked,
      'likesCount': likesCount,
      'postId': postId,
      'postImages': postImages,
    };
  }
}
