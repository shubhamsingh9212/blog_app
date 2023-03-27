import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.BLOG_DETAIL_SCREEN);
      },
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(10),
        child: Column(children: [
          //image
          Container(
            height: 160.h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(
                  "https://t3.ftcdn.net/jpg/01/59/18/36/360_F_159183621_0YTKAAqAA7GI7DlCBfYJ2wfKbC6Zf30V.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text("Blog Post Title",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
          SizedBox(
            height: 10.h,
          ),
        ]),
      ),
    );
  }
}
