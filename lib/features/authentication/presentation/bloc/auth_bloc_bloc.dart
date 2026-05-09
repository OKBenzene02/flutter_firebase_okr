import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:instagram_posts/core/services/shared_preferences/shared_pref_helper.dart';
import 'package:instagram_posts/core/services/shared_preferences/shared_pref_keys.dart';
import 'package:instagram_posts/core/utils/custom_loaders.dart';
import 'package:instagram_posts/features/authentication/domain/entities/user_entity.dart';
import 'package:instagram_posts/features/authentication/domain/usecases/authentication_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final AuthenticationUsecase _authenticationUsecase;
  final sharedPrefs = SharedPrefHelper();

  AuthBlocBloc({required AuthenticationUsecase authenticationUsecase})
    : _authenticationUsecase = authenticationUsecase,
      super(AuthBlocInitial()) {
    on<AuthRegisterUserEvent>(_registerUser);
    on<AuthSignInEvent>(_signInEvent);
    on<AuthSignOutEvent>(_signOutEvent);
  }

  Future<void> _registerUser(
    AuthRegisterUserEvent event,
    Emitter<AuthBlocState> emit,
  ) async {
    CustomLoaders.showLoading();
    try {
      await _authenticationUsecase.registerUser(event.entity, event.password);
      emit(AuthRegisterUserSuccessState());
      CustomLoaders.hideLoading();
    } catch (e) {
      emit(
        AuthErrorState(message: "Cannot register user error: ${e.toString()}"),
      );
      CustomLoaders.hideLoading();
    }
  }

  Future<void> _signInEvent(
    AuthSignInEvent event,
    Emitter<AuthBlocState> emit,
  ) async {
    CustomLoaders.showLoading();
    try {
      var user = await _authenticationUsecase.signIn(
        event.email,
        event.password,
      );
      if (user != null) {
        SessionManager.saveUser(user);
        emit(AuthSignInSuccessState(entity: user));
      } else {
        emit(AuthErrorState(message: "User not found!"));
      }
      CustomLoaders.hideLoading();
    } catch (e) {
      emit(AuthErrorState(message: "Cannot use signin: ${e.toString()}"));
      CustomLoaders.hideLoading();
    }
  }

  Future<void> _signOutEvent(
    AuthSignOutEvent event,
    Emitter<AuthBlocState> emit,
  ) async {
    CustomLoaders.showLoading();
    try {
      await _authenticationUsecase.signOut();
      SessionManager.clearSession();
      emit(AuthSignOutSuccessState());
      CustomLoaders.hideLoading();
    } catch (e) {
      emit(AuthErrorState(message: "Cannot use signout: ${e.toString()}"));
      CustomLoaders.hideLoading();
    }
  }
}

class SessionManager {
  static final _sharedPrefs = SharedPrefHelper();

  // User-session management
  // save the logged-in user
  static Future<void> saveUser(UserEntity? user) async {
    final map = jsonEncode(user?.toJson());
    await _sharedPrefs.setString(key: SharedPrefKeys.userId, value: map);
  }

  // get the saved user data
  static UserEntity? getUser() {
    final userString = _sharedPrefs.getString(key: SharedPrefKeys.userId);
    if (userString == null) return null;

    final userEntity = jsonDecode(userString);
    return UserEntity.fromJson(userEntity);
  }

  static void clearSession() async {
    _sharedPrefs.removeKey(key: SharedPrefKeys.userId);
    _sharedPrefs.clearSharedPrefs();
  }

  static bool isLoggedIn() {
    return getUser() != null;
  }
}
