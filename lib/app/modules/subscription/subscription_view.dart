import 'package:ameriajproducts/app/common_widgets/common_button.dart';
import 'package:flutter/material.dart';

class SubscriptionView extends StatelessWidget {
  const SubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription'),
      ),
      body: Column(
        children: [
          CommonButton(tittle: 'Go to Payment')
        ],
      ),
    );
  }
}