import 'dart:convert';

import 'package:blog_app/app/data/firebase_functions.dart';
import 'package:blog_app/app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/firebase/firebase_auth.dart';

class ProfileController extends GetxController {
 FirebaseFirestore storage = FirebaseFirestore.instance;
 FirebaseAuthentication functions = FirebaseAuthentication();
 final FirebaseAuth _auth = FirebaseAuth.instance;
 RxString userName= "".obs;

 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserName();
  }

  void getUserName() async {
  debugPrint("get user name");
   var  response = await storage.collection("users").doc(_auth.currentUser!.uid).get() ;
   final jsonResponse = jsonEncode(response.data());
   final userModel = UserModel.fromJson(jsonDecode(jsonResponse));
   debugPrint("user name : ${userModel.name}");
   userName.value = userModel.name ?? "";
  }

}
