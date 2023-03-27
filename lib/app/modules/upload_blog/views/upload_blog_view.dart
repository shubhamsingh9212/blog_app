import 'package:blog_app/app/data/global_widgets/appBar.dart';
import 'package:blog_app/app/data/global_widgets/custom_button.dart';
import 'package:blog_app/app/data/global_widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/upload_blog_controller.dart';

class UploadBlogView extends GetView<UploadBlogController> {
  const UploadBlogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        CustomAppBar(title: "Create Blog"),
        ReusableTextField(
            controller: TextEditingController(), hintText: "Title"),
        SizedBox(
          height: 20.h,
        ),
        ReusableTextField(
          controller: TextEditingController(),
          hintText: "Description",
          maxLine: 5,
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          height: 155.h,
          alignment: Alignment.center,
          child: CustomButton(title: "Upload Image", function: () {}),
        ),
      ]),
      bottomSheet: Container(
        height: 50.h,
        alignment: Alignment.topCenter,
        child: CustomButton(title: "Create Blog", function: () {}),
      ),
    ));
  }
}
