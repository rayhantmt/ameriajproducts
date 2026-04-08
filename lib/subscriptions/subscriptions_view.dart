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
import 'package:url_launcher/url_launcher.dart';
import '../subscriptions/subscriptions_controller.dart'; // Ensure correct path

class PaywallPage extends StatelessWidget {
  const PaywallPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SubscriptionController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.isLoading.value &&
            controller.currentOffering.value == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final package = controller.annualPackage;

        return CustomScrollView(
          slivers: [
            // 1. Modern Header with Close Button
            // SliverAppBar(
            //   expandedHeight: 220,
            //   pinned: true,
            //   leading: IconButton(
            //     icon: const CircleAvatar(
            //       backgroundColor: Colors.black26,
            //       child: Icon(Icons.abc, color: Colors.white),
            //     ),
            //     onPressed: () => Get.back(),
            //   ),
            //   flexibleSpace: FlexibleSpaceBar(
            //     background: Container(
            //       decoration: const BoxDecoration(
            //         gradient: LinearGradient(
            //           colors: [
            //             Colors.greenAccent,
            //             Colors.green,
            //           ], // Modern Blue/Purple
            //           begin: Alignment.topLeft,
            //           end: Alignment.bottomRight,
            //         ),
            //       ),
            //       child: const Center(
            //         child: Icon(
            //           Icons.rocket_launch,
            //           size: 80,
            //           color: Colors.white,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: Get.height * 0.04),
                    // 2. Catchy Headline
                    Text(
                      "Readiness Track Premium",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.0001),
                    Text(
                      "Free for 1 month,then ${package!.storeProduct.priceString} per year.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    Text(
                      'Unlock Full Access to Readiness Track',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    // 3. Feature List
                    _buildFeature(
                      Icons.check_circle,
                      "MedPro Status Tracking: Stay current on medical readiness.",
                    ),
                    _buildFeature(
                      Icons.check_circle,
                      "Weapons & Range Qualification: Log and monitor your scores.",
                    ),
                    _buildFeature(
                      Icons.check_circle,
                      "Physical Fitness Monitoring: Track your ACFT/fitness progress.",
                    ),
                    _buildFeature(
                      Icons.check_circle,
                      "Counseling Management: Keep organized records in one place.",
                    ),

                    SizedBox(height: Get.height * 0.01),

                    // 4. The Subscription Card
                    if (package != null)
                      _buildSubscriptionCard(controller, package),

                    SizedBox(height: Get.height*0.01),

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
                          onPressed: () async {
                            final Uri url = Uri.parse(
                              'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/',
                            );
                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch $url');
                            }
                          },
                          child: const Text("Terms of Use"),
                        ),
                        const Text("|", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    TextButton(
                      onPressed: () async {
                        final Uri url = Uri.parse(
                          'https://www.thereadinesstrack.com/blank',
                        );
                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      child: const Text("Privacy Policy"),
                    ),
                     SizedBox(height: Get.height*0.01),
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
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionCard(
    SubscriptionController controller,
    dynamic package,
  ) {
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
          Text(
            package.storeProduct.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
           SizedBox(height: Get.height*0.011),
          Text(
            controller.trialTermsText,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, color: Colors.black87),
          ),
           SizedBox(height: Get.height*0.02),
          Text(
            package.storeProduct.priceString, // e.g. $29.99/year
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Text("Billed yearly"),
          SizedBox(
            width: double.infinity,
            height: Get.height*0.055,
            child: ElevatedButton(
              onPressed: () => controller.purchasePackage(package),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
              ),
              child: controller.isLoading.value
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(
                      controller.buttonText,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
           SizedBox(height: Get.height*0.01),
          Text(
            "Subscription automatically renews unless canceled at least 24 hours before the end of the current period.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
