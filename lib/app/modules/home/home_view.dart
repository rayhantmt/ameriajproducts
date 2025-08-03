import 'package:ameriajproducts/app/modules/home/home_model.dart';
import 'package:ameriajproducts/app/utils/appimages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
final storedToken = storage.read('token');

print('📦 This is from home screen confirming the Stored Token: $storedToken');

    final data = HomeData().homedata;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(Appimages.mainlogo, height: 40, width: 60),
                    Text(
                      'The Readiness Track',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff131123),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                  
                  ],
                ),
              ),


              SizedBox(height: Get.height * 0.006),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffFEFDFB),
                  boxShadow: [
                    BoxShadow(
                      color: Color(
                        0xff2C78DC,
                      ).withOpacity(0.08), // shadow color
                      blurRadius: 10, // blur effect
                      offset: Offset(4, 4), // X, Y offset
                      spreadRadius: 1, // how far the shadow spreads
                    ),
                  ],
                ),
                height: 70,
                width: double.infinity,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Welcome, Pvt. Alex Rivera',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Color(0xff1F2937),
                          ),
                        ),
                        Text(
                          'June 21, 2025',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xff1F2937),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'UIC: W12345',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff4B5563),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Text(
                            '11:21 AM',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xff4B5563),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: Get.height * 0.006),
              Container(
                width: double.infinity,
                color: Color(0xffE9FFE4),
                height: Get.height * .25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 48,
                      backgroundColor: Color(0xff22C55E),
                      child: Text(
                        '100%',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'Readiness Status: Green',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0xff1F2937),
                      ),
                    ),
                    Text(
                      'Congratulation your information is filled',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xff374151),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.006),
              Row(
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    'Quick Overview',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color(0xff1F2937),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.006),
              Container(
                height: Get.height * 0.40,
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        height: Get.height * 0.08,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffFEFDFB),
                          boxShadow: [
                            BoxShadow(
                              color: Color(
                                0xff2C78DC,
                              ).withOpacity(0.08), // shadow color
                              blurRadius: 10, // blur effect
                              offset: Offset(4, 4), // X, Y offset
                              spreadRadius: 1, // how far the shadow spreads
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(data[index].img),
                            SizedBox(width: 5),
                            Text(
                              data[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff2A2A2A),
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Text('Done',style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xff4B5563)
                            )),
                            Icon(Icons.check,color: Color(0xff22C55E),)
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height * 0.006),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
