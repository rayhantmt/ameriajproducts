import 'package:ameriajproducts/app/modules/medpro_details/medpro_details_controller.dart';
import 'package:ameriajproducts/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedproHistoryView extends StatelessWidget {
  const MedproHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MedproDetailsController>();
    
    final data = controller.medProList;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
       backgroundColor: Colors.white,
        title: Text(
          'Medpro History',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Color(0xff131123),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Container(
            height: 70,
            width: double.infinity,
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
            child: Row(
              children: [
                Icon(Icons.medical_services, color: Color(0xff1893F8)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('Medpro'), Text(data[index].createdDate.toString())],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => Get.toNamed(Approutes.medprohistorydetails,arguments: {
                    'data':data[index].tests
                  }),
                  child: Text(
                    'View Details',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xff1893F8),
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward, color: Color(0xff1893F8)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
