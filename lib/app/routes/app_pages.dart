import 'package:ameriajproducts/app/modules/onboarding/onboarding_view.dart';
import 'package:ameriajproducts/app/modules/splash_screen/splash_screen.dart';
import 'package:ameriajproducts/app/routes/app_routes.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppPages {
  static final pages = [
    GetPage(name: Approutes.splash, page: () => SplashScreen()),
    GetPage(name: Approutes.onboarding, page: () => OnboardingView()),
  ];
}
