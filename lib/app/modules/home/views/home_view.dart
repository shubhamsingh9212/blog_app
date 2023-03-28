import 'package:blog_app/app/data/global_widgets/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 25.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 8.sp),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Blog App",
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w500)),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.account_circle,
                  size: 32.h,
                ))
          ]),
        ),
        Expanded(
            child: GetBuilder<HomeController>(builder: (value){
              if(value.blogs.isNotEmpty){
                return ListView.builder(
                  itemCount: value.blogs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: Post(
                        model: value.blogs[index],
                      ),
                    );
                  },
                );
              }else{
                return const Center(child: Text("No Blogs Available"),);
              }
            },)),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(Routes.UPLOAD_BLOG);
        },
        label: Row(children: [
          Icon(Icons.upload,size: 24.sp),
          const SizedBox(width: 5,),
          Text(
            "Create Blog",
            style: TextStyle(fontSize: 15.sp),
          )
        ]),
      ),
    );
  }
}
