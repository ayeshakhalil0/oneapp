import 'package:flutter/material.dart';
import '../screens/home_page.dart';
import '../screens/launch_page.dart';
import '../screens/wallet_page.dart';
import '../screens/profile_page.dart';
import '../screens/login.dart';
import '../screens/sign_up.dart';
import '../screens/splash_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String launch = '/launch';
  static const String wallet = '/wallet';
  static const String profile = '/profile';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String splash = '/splash';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const HomePage(),
      launch: (context) => const LaunchPage(),
      wallet: (context) => const WalletPage(),
      profile: (context) => const ProfilePage(),
      login: (context) => LoginScreen(),
      signup: (context) => SignUpScreen(),
      splash: (context) => const SplashScreen()
    };
  }
}
