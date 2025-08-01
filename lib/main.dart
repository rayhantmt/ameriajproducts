import 'package:ameriajproducts/app/routes/app_pages.dart';
import 'package:ameriajproducts/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
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
