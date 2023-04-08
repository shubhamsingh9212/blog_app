import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function function;

  const Tile({Key? key, required this.icon, required this.title, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>function(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.all(12.sp),
            child: Row(children: [
              Icon(icon, size: 28.sp),
              SizedBox(
                width: 20.w,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
