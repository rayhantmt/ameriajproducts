import 'package:ameriajproducts/app/modules/admin_details/admin_details_view.dart';
import 'package:ameriajproducts/app/modules/change_password/change_password_binding.dart';
import 'package:ameriajproducts/app/modules/change_password/change_password_view.dart';
import 'package:ameriajproducts/app/modules/change_password_profile/change_password_profile_binding.dart';
import 'package:ameriajproducts/app/modules/change_password_profile/change_password_profile_view.dart';
import 'package:ameriajproducts/app/modules/counseling_details/counseling_details_view.dart';
import 'package:ameriajproducts/app/modules/edit_profile/edit_profile_view.dart';
import 'package:ameriajproducts/app/modules/fitness_details/fitness_details_view.dart';
import 'package:ameriajproducts/app/modules/forgot_password/forgot_password_view.dart';
import 'package:ameriajproducts/app/modules/home/home_view.dart';
import 'package:ameriajproducts/app/modules/log_in/login_binding.dart';
import 'package:ameriajproducts/app/modules/log_in/login_view.dart';
import 'package:ameriajproducts/app/modules/main_screen/main_screen_binding.dart';
import 'package:ameriajproducts/app/modules/main_screen/main_screen_view.dart';
import 'package:ameriajproducts/app/modules/medpro_details/medpro_view.dart';
import 'package:ameriajproducts/app/modules/medpro_history/medpro_history_view.dart';
import 'package:ameriajproducts/app/modules/medpro_history_details/medpro_history_details_view.dart';
import 'package:ameriajproducts/app/modules/onboarding/onboarding_view.dart';
import 'package:ameriajproducts/app/modules/otp_successful/otp_successful_view.dart';
import 'package:ameriajproducts/app/modules/otp_verification/otp_verification_binding.dart';
import 'package:ameriajproducts/app/modules/otp_verification/otp_verification_view.dart';
import 'package:ameriajproducts/app/modules/privacy_policy/privacy_policy_view.dart';
import 'package:ameriajproducts/app/modules/profile/profile_view.dart';
import 'package:ameriajproducts/app/modules/range_detailss/range_details_view.dart';
import 'package:ameriajproducts/app/modules/schedule/schedule_view.dart';
import 'package:ameriajproducts/app/modules/sign_up/sign_up_binding.dart';
import 'package:ameriajproducts/app/modules/sign_up/sign_up_view.dart';
import 'package:ameriajproducts/app/modules/splash_screen/splash_screen.dart';
import 'package:ameriajproducts/app/modules/subscription/subscription_view.dart';
import 'package:ameriajproducts/app/modules/task/task_view.dart';
import 'package:ameriajproducts/app/modules/terms_and_conditions/terms_and_conditions_view.dart';
import 'package:ameriajproducts/app/modules/weapon_details/weapon.dart';
import 'package:ameriajproducts/app/modules/weapon_details/weapon_binding.dart';
import 'package:ameriajproducts/app/modules/weapon_history/weapon_history_view.dart';
import 'package:ameriajproducts/app/modules/weapon_history_details/weapon_history_details.dart';
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
    GetPage(name: Approutes.otp, page: ()=> OtpVerificationView(),binding: OtpBinding()),
    GetPage(name: Approutes.otpsuccess, page: ()=> OtpSuccessfulView()),
    GetPage(name: Approutes.mainscreen, page: ()=> MainScreenView(),binding: MainScreenBinding()),
    GetPage(name: Approutes.changepassword, page:()=> ChangePasswordView(),binding: ChangePasswordBinding()),
    GetPage(name: Approutes.home, page: ()=>HomeView()),
    GetPage(name: Approutes.task, page: ()=>TaskView()),
    GetPage(name: Approutes.schedule, page: ()=>ScheduleView()),
    GetPage(name: Approutes.profile, page: ()=>ProfileView()),
    GetPage(name: Approutes.medpro, page: ()=>MedproView()),
    GetPage(name: Approutes.weapon, page: ()=> Weapon(),binding: WeaponBinding()),
    GetPage(name: Approutes.range, page: ()=>RangeDetailsView()),
    GetPage(name: Approutes.fitnessdetails, page: ()=> FitnessDetailsView()),
    GetPage(name: Approutes.counseling, page: ()=>CounselingDetailsView()),
    GetPage(name: Approutes.admindetails, page: ()=>AdminDetailsView()),
    GetPage(name: Approutes.medprohistory, page: ()=>MedproHistoryView()),
    GetPage(name: Approutes.medprohistorydetails, page: ()=> MedproHistoryDetailsView()),
    GetPage(name: Approutes.editprofile, page: () => EditProfileView(),),
    GetPage(name: Approutes.changepasswordprofile, page: () => ChangePasswordProfileView(),binding:ChangePasswordProfileBinding() ),
    GetPage(name: Approutes.termsandconditions, page: ()=> TermsAndConditionsView()),
    GetPage(name: Approutes.subscription, page: () => SubscriptionView(),),
    GetPage(name: Approutes.privacypolicy, page: () => PrivacyPolicyView(),),
    GetPage(name: Approutes.weaponhistory, page: () => WeaponHistoryView(),),
    GetPage(name: Approutes.weaponhistorydetails, page: () => WeaponHistoryDetails(),)
  ];
}
