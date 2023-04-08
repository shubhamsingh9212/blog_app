import 'package:blog_app/app/data/global_widgets/custom_button.dart';
import 'package:blog_app/app/data/global_widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 100.h,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 35.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            ReusableTextField(
                controller: controller.fullName, hintText: "Full Name"),
            SizedBox(
              height: 20.h,
            ),
            ReusableTextField(
                controller: controller.email, hintText: "Email"),
            SizedBox(
              height: 20.h,
            ),
            ReusableTextField(
                controller: controller.password, hintText: "Password",obscure: true),
            SizedBox(
              height: 40.h,
            ),
            CustomButton(function: () {
              controller.onCreateAccount();
            }, title: "Create Account")
          ],
        ),
      ),
      bottomSheet: Container(
        height: 40.h,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Text(
            "Already have an account",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
