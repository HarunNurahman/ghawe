import 'package:get/get.dart';
import 'package:ghawe/pages/splash-screen_page.dart';

class PageRoutes {
  static final pages = [
    // Route for Splash Screen Page
    GetPage(
      name: '/',
      page: () => SplashScreenPage(),
    )
  ];
}
