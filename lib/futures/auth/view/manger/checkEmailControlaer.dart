// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zosr/core/constant/routersName.dart';

class SendEmailVerify extends GetxController {
  UserCredential? userCredential;
  SendEmailVerify({
    @required this.userCredential,
  });
  sendMassge(UserCredential credential) {
    UserCredential? usedata = userCredential;

    usedata!.user!.sendEmailVerification();
  }

  cekVerfiy() async {
    if (userCredential!.user!.emailVerified == false) {
      return Get.defaultDialog(
          title: "Note!", content: const Text("The Email Not Vefied Yet!"));
    } else if (userCredential!.user!.emailVerified == true) {
      return Get.offAndToNamed(AppRouter.homeScreen);
    }
  }

  @override
  void dispose() {
    dispose();
    super.dispose();
  }
}
