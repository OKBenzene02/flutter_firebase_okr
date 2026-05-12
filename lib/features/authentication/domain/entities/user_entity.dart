import 'package:cloud_firestore/cloud_firestore.dart';

class UserEntity {
  final String uid;
  final String name;
  final String email;

  // Profile
  final String? username;
  final String? bio;
  final String? profileImage;
  final String? website;

  // Privacy
  final bool? isPrivate;
  final bool? isVerified;

  // Social Stats
  final int? followersCount;
  final int? followingCount;
  final int? postsCount;

  // Activity
  final bool? isOnline;
  final DateTime? lastSeen;

  // Metadata
  final DateTime? createdAt;

  const UserEntity({
    required this.uid,
    required this.name,
    required this.email,

    this.username,
    this.bio,
    this.profileImage,
    this.website,

    required this.isPrivate,
    required this.isVerified,

    required this.followersCount,
    required this.followingCount,
    required this.postsCount,

    required this.isOnline,
    this.lastSeen,

    this.createdAt,
  });

  UserEntity copyWith({
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
    return UserEntity(
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

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,

      'username': username,
      'bio': bio,
      'profileImage': profileImage,
      'website': website,

      'isPrivate': isPrivate,
      'isVerified': isVerified,

      'followersCount': followersCount,
      'followingCount': followingCount,
      'postsCount': postsCount,

      'isOnline': isOnline,

      'lastSeen': lastSeen != null
          ? Timestamp.fromDate(lastSeen ?? DateTime.now())
          : null,

      'createdAt': createdAt?.toIso8601String(),
    };
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],

      username: json['username'],
      bio: json['bio'],
      profileImage: json['profileImage'],
      website: json['website'],

      isPrivate: json['isPrivate'] ?? false,
      isVerified: json['isVerified'] ?? false,

      followersCount: json['followersCount'] ?? 0,

      followingCount: json['followingCount'] ?? 0,

      postsCount: json['postsCount'] ?? 0,

      isOnline: json['isOnline'] ?? false,

      lastSeen: json['lastSeen'] != null
          ? (json['lastSeen'] as Timestamp).toDate()
          : null,

      createdAt: json['createdAt'] != null
        ? DateTime.parse(json['createdAt'])
        : null,
    );
  }
}
