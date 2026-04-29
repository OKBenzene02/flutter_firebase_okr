// create a simple user entity

class UserEntity {
  final String? uid;
  final String? name;
  final String? email;
  final String? profileImage;
  final bool? isPrivate;

  UserEntity({
    required this.uid,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.isPrivate,
  });
}
