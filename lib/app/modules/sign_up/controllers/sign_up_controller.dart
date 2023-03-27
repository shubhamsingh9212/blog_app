import 'package:blog_app/app/data/const.dart';
import 'package:blog_app/app/data/firebase/firebase_auth.dart';
import 'package:blog_app/app/data/firebase_functions.dart';
import 'package:blog_app/app/data/global_widgets/indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final FirebaseFunctions _functions = FirebaseFunctions();
  final FirebaseAuthentication _authentication = FirebaseAuthentication();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  void onCreateAccount() async {
    if (fullName.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty) {
      Indicator.showLoading();

      await _authentication.createAccount(email.text.trim(), password.text.trim()).then(
          (value) =>
              {_functions.createUserCredential(fullName.text.trim(), email.text.trim())});
    } else {
      showAlert("All fields are required");
      print("All fields are required");
    }
  }
}
