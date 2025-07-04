import 'package:ameriajproducts/app/modules/forgot_password/forgot_password_view.dart';
import 'package:ameriajproducts/app/modules/log_in/login_binding.dart';
import 'package:ameriajproducts/app/modules/log_in/login_view.dart';
import 'package:ameriajproducts/app/modules/onboarding/onboarding_view.dart';
import 'package:ameriajproducts/app/modules/otp_verification/otp_verification_view.dart';
import 'package:ameriajproducts/app/modules/sign_up/sign_up_binding.dart';
import 'package:ameriajproducts/app/modules/sign_up/sign_up_view.dart';
import 'package:ameriajproducts/app/modules/splash_screen/splash_screen.dart';
import 'package:ameriajproducts/app/routes/app_routes.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppPages {
  static final pages = [
    GetPage(name: Approutes.splash, page: () => SplashScreen()),
    GetPage(name: Approutes.onboarding, page: () => OnboardingView()),
    GetPage(
      name: Approutes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(name: Approutes.signup, page:()=> SignUpView(),binding: SignUpBinding()),
    GetPage(name: Approutes.forgotpassword, page: () => ForgotPasswordView(),),
    GetPage(name: Approutes.otp, page: ()=> OtpVerificationView())
  ];
}
