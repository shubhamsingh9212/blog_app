import 'package:blog_app/app/models/blog_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class Post extends StatelessWidget {
  final BlogModel model;
  const Post({Key? key, required this.model}) : super(key: key);

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
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(model.img ?? ""),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(model.title ?? "",
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
