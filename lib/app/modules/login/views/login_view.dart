import 'package:blog_app/app/data/global_widgets/custom_button.dart';
import 'package:blog_app/app/data/global_widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 100.h,
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      fontSize: 35.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                )),
            SizedBox(
              height: 40.h,
            ),
            ReusableTextField(
                controller: controller.email, hintText: "Email"),
            SizedBox(
              height: 20.h,
            ),
            ReusableTextField(
                controller: controller.password, hintText: "Password", obscure: true
            ),
            SizedBox(
              height: 27.h,
            ),
            CustomButton(function: () {

              controller.onLogin();
            }, title: "Login"),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 40.h,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.SIGN_UP);
          },
          child: Text(
            "Don't have an account",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
