import 'package:flutter/material.dart';

class MedproDetailsAlertDialouge extends StatelessWidget {
  const MedproDetailsAlertDialouge({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fill Form',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.black
            ),
            ),
          ],
        ),
      ),
    );
  }
}