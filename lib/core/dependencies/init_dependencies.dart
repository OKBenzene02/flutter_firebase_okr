import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:instagram_posts/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:instagram_posts/features/authentication/data/services/authentication_data_sources.dart';

final getIt = GetIt.instance;
Future<void> initializeDependencies() async {
  _configureApp();

  _initAuthLayer();
}

// Configure app wide dependencies
Future<void> _configureApp() async {
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
}

// Configure feature wise dependencies
Future<void> _initAuthLayer() async {
  // Pass data source client into the authentication data sources
  getIt.registerFactory<AuthenticationDataSources>(
    () => AuthenticationDataSources(
      auth: getIt<FirebaseAuth>(),
      firebaseFirestore: getIt<FirebaseFirestore>(),
    ),
  );

  // pass data sources into the repo implementation
  getIt.registerFactory<AuthenticationRepositoryImpl>(
    () => AuthenticationRepositoryImpl(
      services: getIt<AuthenticationDataSources>(),
    ),
  );
}
