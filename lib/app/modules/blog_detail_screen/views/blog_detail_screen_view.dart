import 'package:blog_app/app/data/global_widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/blog_detail_screen_controller.dart';

class BlogDetailScreenView extends GetView<BlogDetailScreenController> {
  const BlogDetailScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          const CustomAppBar(title: "Blog"),
          SizedBox(
            height: 20.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Text(
              "Title : ${controller.argument.title ?? ""}",
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.sp),
            height: 200.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                image: DecorationImage(
                    image: NetworkImage(controller.argument.img ?? ""),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Text(
              "Description : ${controller.argument.description ?? ""}",
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),
            ),
          ),
        ]),
      ),
    ));
  }
}
