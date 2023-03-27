import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createAccount(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      var response = await _auth.signInWithEmailAndPassword(email: email, password: password);
     if(response.user != null){
       return true;
     }
     else{
       return false;
     }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<void> logOut() async {
    try {
      _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
