// import 'package:ameriajproducts/subscriptions/subscriptions_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class PaywallPage extends StatelessWidget {
//   final controller = Get.find<SubscriptionController>();

//   @override
//   Widget build(BuildContext context) {
//   controller.fetchOfferings();
//     return Scaffold(
      
//       appBar: AppBar(title: const Text("Go Premium")),
//       body: Obx(() {
//         final offering = controller.currentOffering.value;
//         print(offering.toString());
//         if (offering == null) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         return Column(
//           children: [
//             for (final package in offering.availablePackages)
//               ListTile(
//                 title: Text(package.storeProduct.title),
//                 subtitle: Text(package.storeProduct.description),
//                 trailing: Text(package.storeProduct.priceString),
//                 onTap: () => controller.purchase(package),
//               ),

//             if (controller.isLoading.value) const CircularProgressIndicator(),

//             TextButton(
//               onPressed: controller.restore,
//               child: const Text("Restore Purchases"),
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../subscriptions/subscriptions_controller.dart'; // Ensure correct path

class PaywallPage extends StatelessWidget {
  const PaywallPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SubscriptionController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.isLoading.value && controller.currentOffering.value == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final package = controller.annualPackage;

        return CustomScrollView(
          slivers: [
            // 1. Modern Header with Close Button
            SliverAppBar(
              expandedHeight: 220,
              pinned: true,
              leading: IconButton(
                icon: const CircleAvatar(
                  backgroundColor: Colors.black26,
                  child: Icon(Icons.close, color: Colors.white),
                ),
                onPressed: () => Get.back(),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.greenAccent, Colors.green], // Modern Blue/Purple
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.rocket_launch, size: 80, color: Colors.white),
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 2. Catchy Headline
                    const Text(
                      "Unlock Full Access",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Try all premium features free for 30 days.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 32),

                    // 3. Feature List
                    _buildFeature(Icons.check_circle, "Unlimited Projects"),
                    _buildFeature(Icons.check_circle, "Priority Customer Support"),
                    _buildFeature(Icons.check_circle, "Advanced Data Analytics"),
                    _buildFeature(Icons.check_circle, "Cloud Sync across devices"),

                    const SizedBox(height: 40),

                    // 4. The Subscription Card
                    if (package != null) _buildSubscriptionCard(controller, package),
                    
                    const SizedBox(height: 24),

                    // 5. Restore & Legal
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => controller.restore(),
                          child: const Text("Restore Purchases"),
                        ),
                        const Text("|", style: TextStyle(color: Colors.grey)),
                        TextButton(
                          onPressed: () {/* Link to Terms */},
                          child: const Text("Terms"),
                        ),
                        const Text("|", style: TextStyle(color: Colors.grey)),
                        TextButton(
                          onPressed: () {/* Link to Privacy */},
                          child: const Text("Privacy"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildFeature(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.green, size: 24),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildSubscriptionCard(SubscriptionController controller, dynamic package) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blueAccent, width: 2),
        color: Colors.blueAccent.withOpacity(0.05),
      ),
      child: Column(
        children: [
          const Text(
            "Yearly Membership",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            controller.trialTermsText,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () => controller.purchasePackage(package),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 0,
              ),
              child: controller.isLoading.value
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(
                      controller.buttonText,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}