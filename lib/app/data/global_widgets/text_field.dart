import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLine;
  final bool obscure;

  const ReusableTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.maxLine = 1,
      this.obscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: TextField(
        // keyboardType: isMultiLine ?  TextInputType.multiline : TextInputType.text,
        controller: controller,
        maxLines: maxLine,
        obscureText: obscure,
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }
}
