import 'dart:io';

import 'package:blog_app/app/data/const.dart';
import 'package:blog_app/app/data/firebase_functions.dart';
import 'package:blog_app/app/data/global_widgets/indicator.dart';
import 'package:blog_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadBlogController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  File? imageFile;

  final FirebaseFunctions _functions = FirebaseFunctions();

  Future<void> pickImage() async {
    try {
      ImagePicker _picker = ImagePicker();
      await _picker.pickImage(source: ImageSource.gallery,imageQuality: 30).then((value) {
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
}
