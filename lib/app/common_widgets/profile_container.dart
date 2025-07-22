import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {
  final String tittle;
  final String details;
  final IconData ic;
  final Color iconcolor;
  const ProfileContainer({super.key, required this.tittle, required this.details, required this.ic,required this.iconcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
                    height: 45,
                    child: Row(
                      children: [
                        Icon(ic,
                        color: iconcolor,
                        ),
                        Column(
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
                        )
                      ],
                    ),
                  );
  }
}