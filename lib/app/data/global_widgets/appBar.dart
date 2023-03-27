import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.sp,
      vertical: 10.sp),
      child: Row(children: [
        BackButton(),
        SizedBox(width: 65.w,),
        Text(title,style: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w500
        ),)

      ]),
    );
  }
}
