import 'package:flutter/material.dart';

class Formfield extends StatelessWidget {
  const Formfield({
    super.key,
    this.controller,
    required this.tittle,
    this.icon,
    required this.obsecuretext,
    required this.keyboardtype,
  });
  final TextEditingController? controller;
  final String tittle;
  final Widget? icon;
  final bool obsecuretext;
  final TextInputType keyboardtype;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Color(0xffEFEFEF)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: tittle,
          suffixIcon: icon,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xff75838D),
          ),
        ),
      ),
    );
  }
}
