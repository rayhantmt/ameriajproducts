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
              decoration: BoxDecoration(
                color: Color(0xffFEFDFB),
                border: Border.all(
                  width: 1,
                  color: Color(0xffE6E6E6)
                ),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                children: [
                  Text('Current plan',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xff2C3E50)
                  ),
                  )
                ],
              ),
            ),
            CommonButton(tittle: 'Go to Payment'),

          ],
        ),
      ),
    );
  }
}