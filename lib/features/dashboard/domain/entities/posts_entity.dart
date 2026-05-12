import 'package:instagram_posts/features/authentication/domain/entities/user_entity.dart';

class PostsEntity {
  final String? postId;
  final UserEntity? user;
  final List<String>? postImages;
  final String? caption;
  final int? likesCount;
  final int? commentsCount;
  final bool? isLiked;
  final DateTime? createdAt;

  PostsEntity({
    this.postId,
    this.user,
    this.postImages,
    this.caption,
    this.likesCount,
    this.commentsCount,
    this.isLiked,
    this.createdAt,
  });
}