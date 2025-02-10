import 'package:get/get.dart';
import 'package:rakt_daan/api/auth_repo.dart';
import 'package:rakt_daan/screens/account_creation.dart';
import 'package:rakt_daan/screens/bottom_bar.dart';
import 'package:rakt_daan/screens/contact_us.dart';
import 'package:rakt_daan/screens/homepage.dart';
import 'package:rakt_daan/screens/login.dart';
import 'package:rakt_daan/screens/profile.dart';
import 'package:rakt_daan/screens/sign_up.dart';
import 'package:rakt_daan/screens/splash.dart';
import 'package:rakt_daan/screens/welcome.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/splash',
      page: () => SplaceScreen(),
    ),
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
      name: '/bottom',
      page: () => BottomBar(),
    ),
    GetPage(
      name: '/account_creation',
      page: () => AccountCreation(),
    ),
    GetPage(
      name: '/home',
      page: () => Homepage(),
    ),
    GetPage(
      name: '/profile',
      page: () => ProfilePage(
        uid: AuthRepo.user.uid,
      ),
    ),
    GetPage(name: '/contact', page: () => ContactUs()),
  ];

  // Route names as constants for easy reference
  static const String welcome = '/welcome';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String bottom = '/bottom';
  static const String accountCreation = '/account_creation';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String contact = '/contact';
}
