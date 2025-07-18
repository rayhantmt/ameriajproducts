import 'package:flutter/material.dart';

class MedproDetailsAlertDialouge extends StatelessWidget {
  const MedproDetailsAlertDialouge({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('data'),
          ],
        ),
      ),
    );
  }
}