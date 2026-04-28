import 'package:ameriajproducts/subscriptions/revenue_cat.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class SubscriptionController extends GetxController {
  /// 🔹 Reactive states
  final isPremium = false.obs;
  final isLoading = false.obs;
  final isRestoring = false.obs;
  final isEligibleForTrial =
      false.obs; // Tracks if user can get the 30-day trial

  /// 🔹 Current offering (reactive)
  final currentOffering = Rxn<Offering>();

  /// 🔹 Entitlement ID from config
  static String get entitlementId => RevenueCatConfig.entitlementId;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    await checkSubscription();
    await fetchOfferings();
  }

  /// ✅ CHECK SUBSCRIPTION STATUS
  Future<void> checkSubscription() async {
    try {
      final CustomerInfo info = await Purchases.getCustomerInfo();
      isPremium.value = info.entitlements.active.containsKey(entitlementId);
    } catch (e) {
      isPremium.value = false;
      if (kDebugMode) print('❌ Error checking subscription: $e');
    }
  }

  Future<void> purchasePackage(Package package) async {
    if (isLoading.value) return;

    isLoading.value = true;
    try {
      final PurchaseResult result = await Purchases.purchasePackage(package);

      isPremium.value = result.customerInfo.entitlements.active.containsKey(
        entitlementId,
      );

      if (isPremium.value) {
        Get.offAllNamed('/mainscreen');
        Get.snackbar(
          '🎉 Success',
          isEligibleForTrial.value
              ? 'Your 30-day trial has started!'
              : 'Welcome to Premium!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.colorScheme.primary,
          colorText: Get.theme.colorScheme.onPrimary,
        );
      }
    } on PlatformException catch (e) {
      final errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        Get.snackbar('Error', e.message ?? 'Purchase failed');
      }
    } finally {
      isLoading.value = false;
    }
  }

  /// ✅ RESTORE PURCHASES
  Future<void> restore() async {
    if (isRestoring.value) return;
    isRestoring.value = true;
    try {
      final CustomerInfo info = await Purchases.restorePurchases();
      isPremium.value = info.entitlements.active.containsKey(entitlementId);

      if (isPremium.value) {
        Get.offAllNamed('/mainscreen');
        Get.snackbar('✅ Success', 'Subscription restored!');
      } else {
        Get.snackbar('ℹ️ Note', 'No active subscriptions found.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to restore purchases');
    } finally {
      isRestoring.value = false;
    }
  }

  /// ✅ HELPERS

  // Since you only have one yearly plan, we target the annual package directly
  Package? get annualPackage => currentOffering.value?.annual;

  Future<void> fetchOfferings() async {
    isLoading.value = true;
    try {
      final offerings = await Purchases.getOfferings();
      currentOffering.value = offerings.current;

      // Logic for checking Free Trial eligibility
      if (annualPackage != null) {
        final storeProduct = annualPackage!.storeProduct;

        // ✅ Check eligibility status
        final eligibility =
            await Purchases.checkTrialOrIntroductoryPriceEligibility([
              storeProduct.identifier,
            ]);

        final status = eligibility[storeProduct.identifier]?.status;

        isEligibleForTrial.value =
            status == IntroEligibilityStatus.introEligibilityStatusEligible ||
            status == IntroEligibilityStatus.introEligibilityStatusUnknown;

        if (kDebugMode) {
          print('📦 Yearly Package Found: ${storeProduct.priceString}');
          print('🆔 Product ID: ${storeProduct.identifier}');
          print('✅ Eligibility Status: $status');
          print('🎯 Final Eligible for Trial: ${isEligibleForTrial.value}');
          print('📋 Product Title: ${storeProduct.title}');
          print('💰 Price: ${storeProduct.priceString}');
          print('⏰ Subscription Period: ${storeProduct.subscriptionPeriod}');
        }
      }
    } catch (e) {
      currentOffering.value = null;
      if (kDebugMode) print('❌ Error fetching offerings: $e');
      Get.snackbar('Error', 'Failed to load subscription plans');
    } finally {
      isLoading.value = false;
    }
  }

  // ✅ Button text
  String get buttonText {
    if (annualPackage == null) return "Loading...";

    if (isEligibleForTrial.value) {
      return "Start 30-Day Free Trial";
    }

    return "Subscribe for ${annualPackage!.storeProduct.priceString}/year";
  }

  // ✅ Trial terms text
  String get trialTermsText {
    if (annualPackage == null) return "";

    final price = annualPackage!.storeProduct.priceString;

    if (isEligibleForTrial.value) {
      return "Try free for 30 days, then $price/year. Cancel anytime.";
    }

    return "Subscribe for $price/year. Cancel anytime.";
  }
}
