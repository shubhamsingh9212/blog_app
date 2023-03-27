import 'package:blog_app/app/data/const.dart';
import 'package:blog_app/app/data/firebase/firebase_auth.dart';
import 'package:blog_app/app/data/global_widgets/indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final FirebaseAuthentication _authentication = FirebaseAuthentication();

  void onLogin() async {
    Indicator.showLoading();
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      await _authentication.login(email.text.trim(), password.text.trim()).then((value) {

        Indicator.closeLoading();
        if(value){ Get.offNamed(Routes.HOME);}
        else{
          showAlert("User not found!!");
        }

      });
    }
    else{
      showAlert("All fields are required");

    }
  }
}
