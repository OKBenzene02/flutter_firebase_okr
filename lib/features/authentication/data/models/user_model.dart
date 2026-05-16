import 'package:instagram_posts/features/authentication/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.name,
    required super.email,

    super.username,
    super.bio,
    super.profileImage,
    super.website,

    required super.isPrivate,
    required super.isVerified,

    required super.followersCount,
    required super.followingCount,
    required super.postsCount,

    required super.isOnline,

    super.lastSeen,
    super.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic>? map) {
    return UserModel(
      uid: map?['uid'] ?? '',
      name: map?['name'] ?? '',
      email: map?['email'] ?? '',

      username: map?['username'],
      bio: map?['bio'],
      profileImage: map?['profileImage'],
      website: map?['website'],

      isPrivate: map?['isPrivate'] ?? false,
      isVerified: map?['isVerified'] ?? false,

      followersCount: map?['followersCount'] ?? 0,
      followingCount: map?['followingCount'] ?? 0,
      postsCount: map?['postsCount'] ?? 0,

      isOnline: map?['isOnline'] ?? false,

      lastSeen: map?['lastSeen'] != null
        ? map!['lastSeen'] is Timestamp
            ? (map['lastSeen'] as Timestamp).toDate()
            : DateTime.parse(map['lastSeen'] as String)
        : null,

      createdAt: map?['createdAt'] != null
          ? map!['createdAt'] is Timestamp
                ? (map['createdAt'] as Timestamp).toDate()
                : DateTime.parse(map['createdAt'] as String)
          : null,
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      uid: entity.uid,
      name: entity.name,
      email: entity.email,

      username: entity.username,
      bio: entity.bio,
      profileImage: entity.profileImage,
      website: entity.website,

      isPrivate: entity.isPrivate,
      isVerified: entity.isVerified,

      followersCount: entity.followersCount,
      followingCount: entity.followingCount,
      postsCount: entity.postsCount,

      isOnline: entity.isOnline,

      lastSeen: entity.lastSeen,
      createdAt: entity.createdAt,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "email": email,

      "username": username,
      "bio": bio,
      "profileImage": profileImage,
      "website": website,

      "isPrivate": isPrivate,
      "isVerified": isVerified,

      "followersCount": followersCount,
      "followingCount": followingCount,
      "postsCount": postsCount,

      "isOnline": isOnline,

      "lastSeen": lastSeen != null
          ? Timestamp.fromDate(lastSeen ?? DateTime.now())
          : null,

      "createdAt": createdAt != null
          ? Timestamp.fromDate(createdAt ?? DateTime.now())
          : FieldValue.serverTimestamp(),
    };
  }

  @override
  UserModel copyWith({
    String? uid,
    String? name,
    String? email,

    String? username,
    String? bio,
    String? profileImage,
    String? website,

    bool? isPrivate,
    bool? isVerified,

    int? followersCount,
    int? followingCount,
    int? postsCount,

    bool? isOnline,

    DateTime? lastSeen,
    DateTime? createdAt,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,

      username: username ?? this.username,
      bio: bio ?? this.bio,
      profileImage: profileImage ?? this.profileImage,
      website: website ?? this.website,

      isPrivate: isPrivate ?? this.isPrivate,
      isVerified: isVerified ?? this.isVerified,

      followersCount: followersCount ?? this.followersCount,

      followingCount: followingCount ?? this.followingCount,

      postsCount: postsCount ?? this.postsCount,

      isOnline: isOnline ?? this.isOnline,

      lastSeen: lastSeen ?? this.lastSeen,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
