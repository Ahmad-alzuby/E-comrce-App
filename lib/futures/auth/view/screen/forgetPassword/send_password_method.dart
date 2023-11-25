
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> sendPasswordResetEmail(String email) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
 
      await auth.sendPasswordResetEmail(email: email);

  
    Get.defaultDialog(
        title: 'we well review your reqest and check if the email exists we well send the url massge'.tr,
        content: const Icon(
          Icons.check,
          color: Colors.green,
          size: 100,
        ));
  } on FirebaseAuthException {
  
 
      Get.defaultDialog(
          title: "Unkown Error ",
          content: const Icon(
            Icons.close,
            color: Colors.red,
            size: 100,
          ));
    }
 
}
