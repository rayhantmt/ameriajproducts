// import 'package:ameriajproducts/subscriptions/revenue_cat.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:purchases_flutter/purchases_flutter.dart';

// class SubscriptionController extends GetxController {
//   /// 🔹 Reactive states
//   final isPremium = false.obs;
//   final isLoading = false.obs;

//   /// 🔹 Current offering (reactive)
//   final currentOffering = Rxn<Offering>();

//   //static const entitlementId = "Yearly"; // EXACT RevenueCat ID
// static String get entitlementId => RevenueCatConfig.entitlementId;
//   @override
//   void onInit() {
//     super.onInit();
//     _init();
//   }

//   Future<void> _init() async {
//     await checkSubscription();
//     await fetchOfferings();
//   }

//   /// ✅ CHECK SUBSCRIPTION STATUS
//   Future<void> checkSubscription() async {
//     try {
//       final CustomerInfo info = await Purchases.getCustomerInfo();
//       isPremium.value =
//           info.entitlements.active.containsKey(entitlementId);
//     } catch (e) {
//       isPremium.value = false;
//     }
//   }

//   /// ✅ FETCH OFFERINGS
//   Future<void> fetchOfferings() async {
//     try {
//       final offerings = await Purchases.getOfferings();
//       currentOffering.value = offerings.current;
//       print(currentOffering.toString());
//     } catch (e) {
//       currentOffering.value = null;
//     }
//   }

//   /// ✅ PURCHASE
//   Future<void> purchase(Package package) async {
//     isLoading.value = true;
//     try {
//       final PurchaseResult result =
//           await Purchases.purchasePackage(package);

//       isPremium.value = result.customerInfo.entitlements.active
//           .containsKey(entitlementId);

//       if (isPremium.value) {
//         Get.back(); // close paywall on success
//       }
//     } catch (e) {
//       debugPrint("Purchase failed: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   /// ✅ RESTORE
//   Future<void> restore() async {
//     try {
//       final CustomerInfo info =
//           await Purchases.restorePurchases();

//       isPremium.value =
//           info.entitlements.active.containsKey(entitlementId);

//       if (isPremium.value) {
//         Get.back();
//       }
//     } catch (e) {
//       debugPrint("Restore failed: $e");
//     }
//   }
// }

// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:purchases_flutter/purchases_flutter.dart';

// class PurchaseController extends GetxController {
//   final _apiKeyAndroid = "goog_your_api_key";
//   final _apiKeyIos = "appl_your_api_key";

//   var isPremium = false.obs;
//   var offerings = Rxn<Offerings>();

//   @override
//   void onInit() {
//     super.onInit();
//     initPlatformState();
//   }

//   Future<void> initPlatformState() async {
//     // 1. Debugging: Disable in production
//     await Purchases.setLogLevel(LogLevel.debug);

//     // 2. Configure SDK
//     PurchasesConfiguration configuration;
//     if (Platform.isAndroid) {
//       configuration = PurchasesConfiguration(_apiKeyAndroid);
//     } else {
//       configuration = PurchasesConfiguration(_apiKeyIos);
//     }
//     await Purchases.configure(configuration);

//     // 3. Check current status
//     checkSubscriptionStatus();
    
//     // 4. Fetch products
//     fetchOfferings();
//   }

//   Future<void> fetchOfferings() async {
//     try {
//       offerings.value = await Purchases.getOfferings();
//     } catch (e) {
//       Get.snackbar("Error", "Could not fetch products");
//     }
//   }

//   Future<void> checkSubscriptionStatus() async {
//     CustomerInfo customerInfo = await Purchases.getCustomerInfo();
//     // Replace 'premium_access' with your Entitlement ID
//     isPremium.value = customerInfo.entitlements.all['premium_access']?.isActive ?? false;
//   }

//   // Future<void> purchasePackage(Package package) async {
//   //   try {
//   //     CustomerInfo customerInfo = await Purchases.purchasePackage(package);
//   //     if (customerInfo.entitlements.all['premium_access']?.isActive ?? false) {
//   //       isPremium.value = true;
//   //       Get.back(); // Close the paywall
//   //       Get.snackbar("Success", "Welcome to Premium!");
//   //     }
//   //   } catch (e) {
//   //     // User cancelled or error occurred
//   //     print("Purchase Error: $e");
//   //   }
//   // }
// };
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

  /// 🔹 Current offering (reactive)
  final currentOffering = Rxn<Offering>();

  /// 🔹 Selected package index for UI
  final selectedPackageIndex = 0.obs;

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

      if (kDebugMode) {
        print('✅ Premium Status: ${isPremium.value}');
        print('Active Entitlements: ${info.entitlements.active.keys}');
        print('All Entitlements: ${info.entitlements.all.keys}');
      }
    } catch (e) {
      isPremium.value = false;
      if (kDebugMode) {
        print('❌ Error checking subscription: $e');
      }
    }
  }

  /// ✅ FETCH OFFERINGS
  Future<void> fetchOfferings() async {
    isLoading.value = true;
    try {
      final offerings = await Purchases.getOfferings();
      currentOffering.value = offerings.current;

      if (kDebugMode) {
        print('✅ Current Offering: ${currentOffering.value?.identifier}');
        print('Available Packages: ${currentOffering.value?.availablePackages.length ?? 0}');

        // Print all packages for debugging
        currentOffering.value?.availablePackages.forEach((package) {
          print('📦 Package: ${package.identifier}');
          print('   Price: ${package.storeProduct.priceString}');
          print('   Period: ${package.packageType}');
        });
      }

      // Auto-select annual package if available
      if (currentOffering.value != null &&
          currentOffering.value!.availablePackages.isNotEmpty) {
        final annualIndex = currentOffering.value!.availablePackages
            .indexWhere((pkg) => pkg.packageType == PackageType.annual);
        if (annualIndex != -1) {
          selectedPackageIndex.value = annualIndex;
        }
      }
    } catch (e) {
      currentOffering.value = null;
      if (kDebugMode) {
        print('❌ Error fetching offerings: $e');
      }
      Get.snackbar(
        'Error',
        'Failed to load subscription plans',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// ✅ PURCHASE
  Future<void> purchase(Package package) async {
    if (isLoading.value) return; // Prevent double-tap

    isLoading.value = true;
    try {
      final PurchaseResult result = await Purchases.purchasePackage(package);

      isPremium.value =
          result.customerInfo.entitlements.active.containsKey(entitlementId);

      if (isPremium.value) {
        if (kDebugMode) {
          print('✅ Purchase successful!');
        }
       Get.toNamed('/mainscreen');// Close paywall

        // Show success message
        Get.snackbar(
          '🎉 Success',
          'Welcome to Premium!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.colorScheme.primary,
          colorText: Get.theme.colorScheme.onPrimary,
          duration: Duration(seconds: 3),
        );
      }
    } on PlatformException catch (e) {
      // Handle specific error codes
      final errorCode = PurchasesErrorHelper.getErrorCode(e);

      if (errorCode == PurchasesErrorCode.purchaseCancelledError) {
        if (kDebugMode) {
          print('ℹ️ User cancelled purchase');
        }
        // Don't show error for user cancellation
      } else if (errorCode == PurchasesErrorCode.purchaseNotAllowedError) {
        Get.snackbar(
          'Error',
          'Purchases are not allowed on this device',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
      } else if (errorCode == PurchasesErrorCode.productAlreadyPurchasedError) {
        Get.snackbar(
          'Already Purchased',
          'You already own this subscription. Try restoring purchases.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'Error',
          'Purchase failed. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
      }

      if (kDebugMode) {
        print('❌ Purchase failed: ${e.code} - ${e.message}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Unexpected purchase error: $e');
      }
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// ✅ PURCHASE SELECTED PACKAGE
  Future<void> purchaseSelected() async {
    if (currentOffering.value == null ||
        currentOffering.value!.availablePackages.isEmpty) {
      Get.snackbar(
        'Error',
        'No packages available',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final package =
        currentOffering.value!.availablePackages[selectedPackageIndex.value];
    await purchase(package);
  }

  /// ✅ RESTORE PURCHASES
  Future<void> restore() async {
    if (isRestoring.value) return;

    isRestoring.value = true;
    try {
      final CustomerInfo info = await Purchases.restorePurchases();

      isPremium.value = info.entitlements.active.containsKey(entitlementId);

      if (isPremium.value) {
        if (kDebugMode) {
          print('✅ Restore successful!');
        }
       Get.offAllNamed('/mainscreen');
        Get.snackbar(
          '✅ Success',
          'Subscription restored!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.colorScheme.primary,
          colorText: Get.theme.colorScheme.onPrimary,
        );
      } else {
        Get.snackbar(
          'ℹ️ No Purchases Found',
          'No active subscriptions to restore',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Restore failed: $e');
      }
      Get.snackbar(
        'Error',
        'Failed to restore purchases',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
    } finally {
      isRestoring.value = false;
    }
  }

  /// ✅ HELPER: Get package by identifier
  Package? getPackage(String identifier) {
    return currentOffering.value?.availablePackages.firstWhereOrNull(
      (package) => package.identifier == identifier,
    );
  }

  /// ✅ HELPER: Get annual package
  Package? get annualPackage =>
      currentOffering.value?.annual ?? getPackage('\$rc_annual');

  /// ✅ HELPER: Get monthly package
  Package? get monthlyPackage =>
      currentOffering.value?.monthly ?? getPackage('\$rc_monthly');

  /// ✅ HELPER: Format price per period
  String getPricePerPeriod(Package package) {
    final price = package.storeProduct.priceString;
    switch (package.packageType) {
      case PackageType.annual:
        return '$price/year';
      case PackageType.monthly:
        return '$price/month';
      case PackageType.weekly:
        return '$price/week';
      default:
        return price;
    }
  }

  /// ✅ HELPER: Get savings text
  String? getSavingsText(Package package) {
    if (package.packageType == PackageType.annual && monthlyPackage != null) {
      final annualPrice = package.storeProduct.price;
      final monthlyPrice = monthlyPackage!.storeProduct.price * 12;
      final savings = ((monthlyPrice - annualPrice) / monthlyPrice * 100).round();
      return 'Save $savings%';
    }
    return null;
  }
}