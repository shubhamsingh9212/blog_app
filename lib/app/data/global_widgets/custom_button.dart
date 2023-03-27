import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final Function function;
  final String title;

  const CustomButton({Key? key, required this.function, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(5)),
          child: Text(
            title,
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          ),
        ));
  }
}
