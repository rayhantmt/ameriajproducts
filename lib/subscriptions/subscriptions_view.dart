import 'package:ameriajproducts/subscriptions/subscriptions_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaywallPage extends StatelessWidget {
  final controller = Get.find<SubscriptionController>();

  @override
  Widget build(BuildContext context) {
  controller.fetchOfferings();
    return Scaffold(
      
      appBar: AppBar(title: const Text("Go Premium")),
      body: Obx(() {
        final offering = controller.currentOffering.value;
        print(offering.toString());
        if (offering == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            for (final package in offering.availablePackages)
              ListTile(
                title: Text(package.storeProduct.title),
                subtitle: Text(package.storeProduct.description),
                trailing: Text(package.storeProduct.priceString),
                onTap: () => controller.purchase(package),
              ),

            if (controller.isLoading.value) const CircularProgressIndicator(),

            TextButton(
              onPressed: controller.restore,
              child: const Text("Restore Purchases"),
            ),
          ],
        );
      }),
    );
  }
}
