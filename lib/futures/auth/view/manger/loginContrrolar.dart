// ignore_for_file: file_names, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zosr/futures/auth/view/manger/checkEmailControlaer.dart';
import 'package:zosr/servers/serviers.dart';

class LoginControllar extends GetxController {
  Icon iconsPassword = const Icon(Icons.lock_outline);
  MYServices myServices = Get.find();
  bool? isShowPassowrd = true;
  showPassword() {
    isShowPassowrd = !isShowPassowrd!;

    update();
  }

  changeIcon() {
    iconsPassword = iconsPassword == const Icon(Icons.lock_outline)
        ? const Icon(Icons.remove_red_eye_outlined)
        : const Icon(Icons.lock_outline);
    update();
  }

  GlobalKey<FormState> formState = GlobalKey();
  validator(
    String Routename, {
    required String password,
    required String emailAddress,
  }) async {
    if (formState.currentState!.validate()) {
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );
        MYServices.sharedPreferences.setString('googleImage',
            'https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg');
        MYServices.sharedPreferences.setString('image', '');

        MYServices.sharedPreferences.setString('googleImage',
            'https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg');
        await MYServices.sharedPreferences.setBool("Log", true);

        SendEmailVerify(userCredential: credential).cekVerfiy();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          return Get.defaultDialog(
              title: 'Note',
              content: const Text('The password provided is too weak.'));
        } else if (e.code == 'user-not-found') {
          return Get.defaultDialog(
              title: 'Note',
              content:
                  const Text('The account already exists for that email.'));
        } else {
          return Get.defaultDialog(title: 'Note', content: Text(e.code));
        }
      }
    }
  }

  @override
  void dispose() {
    dispose();
    super.dispose();
  }
}
