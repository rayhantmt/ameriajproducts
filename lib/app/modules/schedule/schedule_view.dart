import 'package:ameriajproducts/app/modules/schedule/schedule_model.dart';
import 'package:flutter/material.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = scheduledata().sdata;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Schedule Appointment',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xff1E293B),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 80),
            Text(
              'Schedule Today',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Color(0xff1E293B),
              ),
            ),

            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => Container(
                  height: 90,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index].tittle,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Color(0xff111827),
                            ),
                          ),
                          Text(
                            data[index].details,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xff4B5563),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Color(0xff08692C)),
                              Text(
                                data[index].location,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xff6B7280),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.delete_outline_outlined,
                            color: Color(0xffDE2626),
                          ),
                          Row(
                            children: [
                              Icon(Icons.access_time, color: Color(0xff667085)),
                              Text(
                                data[index].time,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xff667085),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: OutlinedButton(
        style: ButtonStyle(
           shape: MaterialStateProperty.all(const CircleBorder()),
          backgroundColor:  MaterialStateProperty.all(Color(0xff08692C))
        ),
        onPressed: (){}, child: Icon(Icons.add,
        color: Colors.white,
        )),
    );
  }
}
