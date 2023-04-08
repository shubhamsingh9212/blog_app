import 'dart:io';

import 'package:blog_app/app/data/const.dart';
import 'package:blog_app/app/data/global_widgets/indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/blog_models.dart';
import '../routes/app_pages.dart';

class FirebaseFunctions {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;

  final RxBool isLoading = false.obs;

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

      await _firebaseFirestore
          .collection("blogs")
          .doc(id)
          .set(blogDetails)
          .then((value) => saveDataToMyBlogs(id));
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
      showAlert(e.toString());
    }
    return url;
  }

  Future<List<BlogModel>> getBlogs() async {
    List<BlogModel> blogData = [];
    try {
      await _firebaseFirestore.collection("blogs").get().then((value) {
        for (int i = 0; i < value.docs.length; i++) {
          blogData.add(BlogModel.fromJson(value.docs[i].data()));
        }
        return blogData;
      });
    } catch (e) {
      showAlert(e.toString());
      return [];
    }

    return blogData;
  }

  Future<void> saveDataToMyBlogs(String id) async {
    try {
      await _firebaseFirestore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .collection("myblog")
          .doc(id)
          .set({
        "id": id,
      });
    } catch (e) {
      showAlert(e.toString());
    }
  }

  Future<List> getMyBlogs() async {
    try {
      var snapshot = await _firebaseFirestore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .collection("myblog")
          .get();

      return snapshot.docs.map((e) => e.data()["id"]).toList();
    } catch (e) {
      showAlert("$e");
      return [];
    }
  }

  Future<BlogModel> getBlogsById(String id) async {
    try {
      var documentSnapshot =
          await _firebaseFirestore.collection("blogs").doc(id).get();

      return BlogModel.fromJson(documentSnapshot.data()!);
    } catch (e) {
      showAlert("$e");
      return BlogModel(img: "", description: "", title: "", id: "");
    }
  }

  Future<void> deletePublicBlog(String id) async {
    try {
      await _firebaseFirestore.collection("blogs").doc(id).delete();
    } catch (e) {
      showAlert("$e");
    }
  }
  Future<void> deleteBlog(String id) async{
    await Future.wait([
      deleteMyBlog(id),
      deletePublicBlog(id)
    ]);
  }



  Future<void> deleteMyBlog(String id) async {
    debugPrint("doc id : $id");
    try {
      await _firebaseFirestore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .collection("myblog")
          .doc(id)
          .delete();


    } catch (e) {
      showAlert("$e");
    }
  }

  Future<void> editBlog(String id , Map <String,dynamic> map) async{

    try{
      await _firebaseFirestore.collection("blogs").doc(id).update(map);

    }catch(e){showAlert("$e");}

  }

}
