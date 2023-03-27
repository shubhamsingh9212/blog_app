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
      body: SingleChildScrollView(
        child: Column(children: [
          const CustomAppBar(title: "Create Blog"),
          ReusableTextField(controller: controller.title, hintText: "Title"),
          SizedBox(
            height: 20.h,
          ),
          ReusableTextField(
            controller: controller.description,
            hintText: "Description",
            maxLine: 5,
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            alignment: Alignment.center,
            child: GetBuilder<UploadBlogController>(builder: (value) {
              if (value.imageFile != null) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: GestureDetector(
                      onTap: () {
                        controller.pickImage();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          value.imageFile!,
                          fit: BoxFit.cover,
                          height: 200.h,
                          width: Get.width,
                        ),
                      )),
                );
              } else {
                return CustomButton(
                    title: "Upload Image",
                    function: () {
                      controller.pickImage();
                    });
              }
            }),
          ),
          SizedBox(height: 20.h,),
          Container(
            height: 50.h,
            margin: EdgeInsets.only(bottom: 10.sp),
            alignment: Alignment.topCenter,
            child: CustomButton(
                title: "Create Blog",
                function: () {
                  controller.createBlog();
                }),
          ),
        ]),
      ),

    ));
  }
}
