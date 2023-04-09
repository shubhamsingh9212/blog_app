import 'package:blog_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/global_widgets/tiles.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: Get.width,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 50.h,
            ),
            Container(
              height: 150.h,
              width: 150.w,
              decoration: BoxDecoration(
                  color: Colors.grey[800], shape: BoxShape.circle),
              alignment: Alignment.center,
              child: Obx(
                () => controller.userName.value.isNotEmpty
                    ? Text(controller.userName.value.substring(0, 1),
                        style: TextStyle(fontSize: 70.sp, color: Colors.white))
                    : const SizedBox(),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Obx(
              () => Text(
                controller.userName.value,
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Tile(
                icon: Icons.edit,
                title: "My Blogs",
                function: () {
                  Get.toNamed(Routes.MY_BLOGS);
                }),
            SizedBox(
              height: 20.h,
            ),
            Tile(
                icon: Icons.logout,
                title: "Log Out",
                function: () {
                  controller.functions.logOut();
                }),
          ]),
        ),
      ),
    );
  }
}
