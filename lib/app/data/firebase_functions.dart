import 'dart:io';

import 'package:blog_app/app/data/const.dart';
import 'package:blog_app/app/data/global_widgets/indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class FirebaseFunctions {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;

  Future<void> createUserCredential(String name, String email) async {
    try {
      await _firebaseFirestore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .set({
        "uid": _auth.currentUser!.uid,
        "name": name,
        "email": email
      }).then((value) {
        Indicator.closeLoading();
        Get.toNamed(Routes.HOME);
      });
    } catch (e) {
      showAlert(e.toString());
    }
  }

  Future<void> uploadBlog(String title, String description, File image) async {
    try {
      String id = generateId();
      DateTime time = DateTime.now();
      String imageUrl = await uploadImage(image);

      Map<String, dynamic> blogDetails = {
        "id": id,
        "title": title,
        "description": description,
        "img": imageUrl,
        "time": time
      };

      await _firebaseFirestore.collection("blogs").doc(id).set(blogDetails);
    } catch (e) {
      showAlert(e.toString());
    }
  }

  Future<String> uploadImage(File file) async {
    String url = "";
    try {
      String imageName = generateId();
      var refrence = _storage.ref().child("/image").child("/$imageName.jpg");
      var uploadTask = await refrence.putFile(file);
      url = await uploadTask.ref.getDownloadURL();
      return url;
    } catch (e) {
      showAlert("${e}");
    }
    return url;
  }
}
