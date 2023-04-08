import 'dart:io';

import 'package:blog_app/app/data/const.dart';
import 'package:blog_app/app/data/firebase_functions.dart';
import 'package:blog_app/app/data/global_widgets/indicator.dart';
import 'package:blog_app/app/models/blog_models.dart';
import 'package:blog_app/app/modules/home/controllers/home_controller.dart';
import 'package:blog_app/app/modules/my_blogs/controllers/my_blogs_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadBlogController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  BlogModel? model = Get.arguments;

  File? imageFile;

  final FirebaseFunctions _functions = FirebaseFunctions();

  Future<void> pickImage() async {
    try {
      ImagePicker _picker = ImagePicker();
      await _picker
          .pickImage(source: ImageSource.gallery, imageQuality: 30)
          .then((value) {
        if (value != null) {
          imageFile = File(value.path);
          update();
        }
      });
    } catch (e) {
      showAlert(e.toString());
    }
  }

  Future<void> createBlog() async {
    if (title.text.isNotEmpty && description.text.isNotEmpty) {
      if (imageFile != null) {
        Indicator.showLoading();
        await _functions
            .uploadBlog(title.text, description.text, imageFile!)
            .then((value) {
          Indicator.closeLoading();
          showAlert("Blog created successfully");
          Get.back();
          final homeController = Get.find<HomeController>();
          homeController.getData();
        });
      } else {
        showAlert("Image is required");
      }
    } else {
      showAlert("All fields are required");
    }
  }

  void editBlog(BlogModel model) async {
    Indicator.showLoading();
    if (title.text.isNotEmpty && description.text.isNotEmpty) {
      if (imageFile == null) {
        Map<String, dynamic> map = {
          "title": title.text,
          "description": description.text
        };
        await _functions.editBlog(model.id ?? "", map);
      } else {
        String imageUrl = await _functions.uploadImage(imageFile!);
        Map<String, dynamic> map = {
          "title": title.text,
          "description": description.text,
          "image": imageUrl
        };
        await _functions.editBlog(model.id ?? "", map);
      }
    } else {
      showAlert("All fields are required");
    }
    Indicator.closeLoading();
    updateData();
  }

  void updateData() {
    final controller = Get.find<MyBlogsController>();
    Get.back();
    controller.myBlogs = [];
    Indicator.showLoading();
    controller.getMyBlogData();
  }
}
