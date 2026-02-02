import 'package:ameriajproducts/app/routes/app_pages.dart';
import 'package:ameriajproducts/app/routes/app_routes.dart';
import 'package:ameriajproducts/subscriptions/revenue_cat.dart';
import 'package:ameriajproducts/subscriptions/subscriptions_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeRevenueCat();
  Get.put(SubscriptionController());
  await GetStorage.init();
  runApp(const MyApp());
}

Future<void> initializeRevenueCat() async {
  try {
    // Configure RevenueCat with platform-specific API key
    await Purchases.configure(PurchasesConfiguration(RevenueCatConfig.apiKey));

    // Enable debug logs in development
    if (kDebugMode) {
      await Purchases.setLogLevel(LogLevel.debug);
    }

    if (kDebugMode) {
      print('✅ RevenueCat initialized successfully');
    }
  } catch (e) {
    if (kDebugMode) {
      print('❌ Error initializing RevenueCat: $e');
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Approutes.splash,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
