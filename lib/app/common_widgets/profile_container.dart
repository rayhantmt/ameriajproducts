import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileContainer extends StatelessWidget {
  final String tittle;
  final String details;
  //final IconData ic;
 // final Color iconcolor;
 final String icon;
  const ProfileContainer({super.key, required this.tittle, required this.details, required this.icon,});

  @override
  Widget build(BuildContext context) {
    return Container(
    
                    height: 45,
                    child: Row(
                      children: [
                        SvgPicture.asset(icon),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(tittle,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xff063749)
                            ),
                            ),
                            Text(details,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xff989898)
                            ),
                            ),

                          ],
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    ),
                  );
  }
}