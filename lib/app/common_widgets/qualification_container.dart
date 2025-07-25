import 'package:flutter/material.dart';

class QualificationContainer extends StatelessWidget {
  const QualificationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
          boxShadow: [
          BoxShadow(
            color: Color(0xff2C78DC).withOpacity(.08),
            offset: const Offset(0, 3),
            blurRadius: 12,
          ),
        ],
      ),
    );
  }
}