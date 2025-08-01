import 'package:ameriajproducts/app/common_widgets/qualification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class QualificationContainer extends StatelessWidget {
  final String title;
  final String img;

  const QualificationContainer({
    super.key,
    required this.title,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QualificationController());

    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff2C78DC).withOpacity(.08),
            offset: const Offset(0, 3),
            blurRadius: 12,
          ),
        ],
      ),
      child: Obx(() => Row(
        children: [
          SvgPicture.asset(img),
          const SizedBox(width: 10),
          Text(title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color(0xff2A2A2A)
          ),
          ),
          Spacer(),
          Checkbox(
            checkColor: Colors.white,activeColor: Color(0xff22C55E),
             
            value: controller.qualifications[title] ?? false,
            onChanged: (value) => controller.toggleQualification(title, value),
          ),
        ],
      )),
    );
  }
}