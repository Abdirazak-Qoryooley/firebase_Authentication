// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_notification/view/home.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create account
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar(
        'Success',
        'Your account has been created.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.green,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Weak Password',
          'The password provided is too weak.',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Email Already in Use',
          'The account already exists for that email.',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.blue,
        );
      } else {
        Get.snackbar(
          'Error',
          'An unknown error occurred.',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Unknown Error',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }


Future<void> signInWithEmailAndPassword({required String email, required String password})async{
  try {
await  _auth.signInWithEmailAndPassword(
    email: email,
    password: password
  );
    Get.snackbar(
        'Sig in',
        'Welcome Dashboard',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.green,
      );
      Get.to(()=>home());
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {

        Get.snackbar(
        'user-not-found',
        'No user found for that email',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
        Get.snackbar(
        'wrong-password',
        'Wrong password provided for that user.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
  }
}
}


}
