import 'package:get/get.dart';
import 'package:ghawe/pages/onboarding_page.dart';
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
    )
  ];
}
