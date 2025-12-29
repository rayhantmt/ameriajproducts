import 'package:ameriajproducts/app/common_widgets/common_button.dart';
import 'package:ameriajproducts/app/common_widgets/formfield.dart';
import 'package:ameriajproducts/app/modules/edit_profile/edit_profile_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Edit profile',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xff2A2A2A),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(height: Get.height * 0.02),
              // GestureDetector(
              //   onTap: controller.pickProfileImage,
              //   child: Center(
              //     child: Stack(
              //       children: [
              //         // Profile image
              //         CircleAvatar(
              //           radius: 50, // adjust size as needed
              //           backgroundImage: AssetImage(Appimages.profile),
              //         ),

              //         // Camera icon overlay
              //         Positioned(
              //           bottom: 0,
              //           right: 0,
              //           child: Container(
              //             height: 30,
              //             width: 30,
              //             decoration: BoxDecoration(
              //               color: Colors.black87,
              //               shape: BoxShape.circle,
              //             ),
              //             child: Icon(
              //               Icons.camera_alt,
              //               color: Colors.white,
              //               size: 16,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(height: Get.height * 0.02),
              Text(
                'Full Name',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff2A2A2A),
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: Get.height * 0.01),
              Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xffEFEFEF)),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: controller.namecontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hint: Text(
                        'Enter your First Name',

                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff75838D),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                'UIC',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff2A2A2A),
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: Get.height * 0.01),
              Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xffEFEFEF)),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: controller.uiccontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hint: Text(
                        'Enter',

                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff75838D),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                'Rank',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff2A2A2A),
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: Get.height * 0.01),
              Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xffEFEFEF)),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: controller.rankcontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hint: Text(
                        'Enter',

                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff75838D),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: Get.height * 0.02),
              Row(
                children: [
                  Obx(
                    () => CountryCodePicker(
                      onChanged: (code) => controller.countryCode.value =
                          code.dialCode ?? '+880',
                      initialSelection: controller.countryCode.value,
                      favorite: ['+880', 'BD'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                  ),

                  Expanded(
                    child: Formfield(
                      controller: controller.phonecontroller,
                      tittle: 'Enter you phone number',
                      obsecuretext: false,
                      keyboardtype: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.02),

              GestureDetector(
                onTap: controller.updateprofile,
                child: Obx(
                  () => controller.isLoading.value
                      ? Center(
                          child: CircularProgressIndicator(color: Colors.green),
                        )
                      : CommonButton(tittle: 'Save Changes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
