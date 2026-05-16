import 'package:instagram_posts/features/authentication/data/models/user_model.dart';
import 'package:instagram_posts/features/authentication/domain/entities/user_entity.dart';
import 'package:instagram_posts/features/dashboard/data/models/posts_models.dart';
import 'package:instagram_posts/features/dashboard/domain/entities/posts_entity.dart';

extension UserModelMapper on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      name: name,
      email: email,

      username: username,
      bio: bio,
      profileImage: profileImage,
      website: website,

      isPrivate: isPrivate,
      isVerified: isVerified,

      followersCount: followersCount,
      followingCount: followingCount,
      postsCount: postsCount,

      isOnline: isOnline,

      lastSeen: lastSeen,
      createdAt: createdAt,
    );
  }
}

extension UserEntityMapper on UserEntity {
  UserModel toModel() {
    return UserModel(
      uid: uid,
      name: name,
      email: email,

      username: username,
      bio: bio,
      profileImage: profileImage,
      website: website,

      isPrivate: isPrivate,
      isVerified: isVerified,

      followersCount: followersCount,
      followingCount: followingCount,
      postsCount: postsCount,

      isOnline: isOnline,

      lastSeen: lastSeen,
      createdAt: createdAt,
    );
  }
}

extension PostsModelMapper on PostsModels {
  PostsEntity toEntity() {
    return PostsEntity(
      userId: userId,
      user: user,
      caption: caption,
      commentsCount: commentsCount,
      createdAt: createdAt,
      isLiked: isLiked,
      likesCount: likesCount,
      postId: postId,
      postImages: postImages,
    );
  }
}
