import 'package:get/get.dart';
import 'package:ghawe/pages/dashboard_page.dart';
import 'package:ghawe/pages/detail_page.dart';
import 'package:ghawe/pages/forgot-password_page.dart';
import 'package:ghawe/pages/onboarding_page.dart';
import 'package:ghawe/pages/sign-in_page.dart';
import 'package:ghawe/pages/sign-up_page.dart';
import 'package:ghawe/pages/splash-screen_page.dart';

class PageRoutes {
  static final pages = [
    // Route for Splash Screen Page
    GetPage(
      name: '/',
      page: () => SplashScreenPage(),
    ),
    // Route for On Boarding Page
    GetPage(
      name: '/on-boarding',
      page: () => OnBoardingPage(),
    ),
    // Route for Sign In Page
    GetPage(
      name: '/sign-in',
      page: () => SignInPage(),
    ),
    // Route for Sign Up Page
    GetPage(
      name: '/sign-up',
      page: () => SignUpPage(),
    ),
    // Route for Forgot Password Page
    GetPage(
      name: '/forgot-password',
      page: () => ForgotPasswordPage(),
    ),
    // Route for Dashboard Page
    GetPage(
      name: '/dashboard',
      page: () => DashboardPage(),
    ),
    
  ];
}
