import 'package:instagram_posts/features/authentication/domain/entities/user_entity.dart';
import 'package:instagram_posts/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticationUsecase {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationUsecase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  Future<UserEntity?> signIn(String? email, String? password) async {
    var user = await _authenticationRepository.signIn(email, password);
    return user;
  }

  Future<void> registerUser(UserEntity? user, String? password) async {
    await _authenticationRepository.registerUser(user, password);
  }

  Future<void> signOut() async {
    await _authenticationRepository.signOut();
  }

  Future<UserEntity?> getCurrentUser() async {
    var user = await _authenticationRepository.getCurrentUser();
    return user;
  }
}
