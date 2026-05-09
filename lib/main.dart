import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:instagram_posts/core/dependencies/bloc_provider_helper.dart';
import 'package:instagram_posts/core/dependencies/init_dependencies.dart';
import 'package:instagram_posts/core/services/firebase/firebase_options.dart';
import 'package:instagram_posts/core/themes/dark_theme.dart';
import 'package:instagram_posts/core/themes/light_theme.dart';
import 'package:instagram_posts/core/utils/custom_loaders.dart';
import 'package:instagram_posts/core/utils/navigation_helper.dart';
import 'package:instagram_posts/features/authentication/presentation/bloc/auth_bloc_bloc.dart';
import 'package:instagram_posts/features/authentication/presentation/pages/auth_screen.dart';
import 'package:instagram_posts/features/dashboard/presentation/dashboard.dart';

void main() async {
  // Firebase configuration
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    providerAndroid: AndroidDebugProvider(),
    providerApple: AppleDebugProvider(),
  );
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    CustomLoaders.config(context);
    return BlocProviderHelper(
      child: MaterialApp(
        builder: EasyLoading.init(),
        scaffoldMessengerKey: NavigationHelper.scaffoldMessengerKey,
        navigatorKey: NavigationHelper.navigatorKey,
        title: 'Instagramify',
        darkTheme: DarkTheme.darkThemeConfig,
        theme: LightTheme.lightThemeConfig,
        themeMode: ThemeMode.system,
        home: _decideLandingScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  Widget? _decideLandingScreen() {
    final isLoggedIn = SessionManager.isLoggedIn();
    if (isLoggedIn) {
      final user = SessionManager.getUser();
      return Dashboard(user: user);
    } else {
      return AuthLoginScreen();
    }
  }
}
