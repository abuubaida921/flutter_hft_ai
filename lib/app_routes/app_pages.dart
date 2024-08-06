
import 'package:flutter_hft_ai/signup_screen.dart';
import 'package:get/get.dart';
import '../home_screen.dart';
import '../signin_screen.dart';
import '../splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
        name: Routes.HOME,
        page: () => HomeScreen(),
    ),
    GetPage(
        name: Routes.SIGNIN,
        page: () => SignInScreen(),
    ),
    GetPage(
        name: Routes.SIGNUP,
        page: () => SignupScreen(),
    ),

  ];
}
