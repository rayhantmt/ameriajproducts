import 'package:ameriajproducts/app/common_widgets/common_button.dart';
import 'package:ameriajproducts/app/modules/otp_verification/otp_verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';


class OtpVerificationView extends StatelessWidget {
   OtpVerificationView({super.key});
final String email = Get.arguments;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OtpController>();

    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "OTP Verification",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1B1E28),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Enter 6-digit Code",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1B1E28),
              ),
            ),
            const SizedBox(height: 4),
             Text(
              "Your code was sent to $email ",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF7D848D),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 40,
                  child: TextField(
                    controller: controller.otpControllers[index],
                    focusNode: controller.otpFocusNodes[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: const InputDecoration(
                      counterText: '',
                      border: UnderlineInputBorder(),
                    ),
                    onChanged: (value) {
                      controller.onOtpFieldChanged(value, index);
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),
            Obx(() => GestureDetector(
                  onTap: controller.secondsRemaining.value == 0
                      ? controller.resendCode
                      : null,
                  child: Text(
                    controller.secondsRemaining.value == 0
                        ? "Resend code"
                        : "Resend code ${controller.secondsRemaining}s",
                    style: TextStyle(
                      color: controller.secondsRemaining.value == 0
                          ? const Color(0xFF1B1E28)
                          : const Color(0xFF7D848D),
                    ),
                  ),
                )),
            const SizedBox(height: 32),
           GestureDetector(
           onTap: () => //print(controller.otp.value),
           Get.toNamed('/changepassword'),
            child: CommonButton(tittle: 'Verify '))
          ],
        ),
      ),
    );
  }
}
