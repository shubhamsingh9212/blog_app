import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLine;

  const ReusableTextField(
      {Key? key, required this.controller, required this.hintText,  this.maxLine = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: TextField(
        // keyboardType: isMultiLine ?  TextInputType.multiline : TextInputType.text,
        controller: controller,
        maxLines: maxLine ,
        decoration: InputDecoration(
        hintText: hintText,
        border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.white))),
    )
    ,

    );
  }
}
