import 'package:get/get.dart';
import 'package:rakt_daan/screens/account_creation.dart';
import 'package:rakt_daan/screens/homepage.dart';
import 'package:rakt_daan/screens/login.dart';
import 'package:rakt_daan/screens/sign_up.dart';
import 'package:rakt_daan/screens/welcome.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/welcome',
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
    ),
    GetPage(
      name: '/signUp',
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: '/home',
      page: () => Homepage(),
    ),
    GetPage(
      name: '/account_creation',
      page: () => AccountCreation(),
    ),
  ];

  // Route names as constants for easy reference
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String home = '/home';
  static const String accountCreation = '/account_creation';
}
