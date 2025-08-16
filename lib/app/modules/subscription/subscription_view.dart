import 'package:ameriajproducts/app/common_widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionView extends StatelessWidget {
  const SubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFDF6),
      appBar: AppBar(
        backgroundColor: Color(0xffFFFDF6),
        title: Text('Subscription'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            SizedBox(height: Get.height*0.05,),
            Container(
              height:100 ,
            ),
            CommonButton(tittle: 'Go to Payment'),

          ],
        ),
      ),
    );
  }
}