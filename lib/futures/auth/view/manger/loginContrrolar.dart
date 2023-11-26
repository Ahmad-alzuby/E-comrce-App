// ignore_for_file: file_names, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:zosr/futures/auth/view/manger/checkEmailControlaer.dart';
import 'package:zosr/servers/serviers.dart';

class LoginControllar extends GetxController {
  Rx<bool> isLoading = false.obs;
  Rx<Icon> iconsPassword = const Icon(FontAwesomeIcons.eyeSlash , size: 18,).obs;
  MYServices myServices = Get.find();
  bool isShowPassowrd = true;
  showPassword() {
    changeIcon();

    isShowPassowrd = !isShowPassowrd;

    update();
  }

  changeIcon() {
    iconsPassword.value = isShowPassowrd
        ? const Icon(FontAwesomeIcons.eye,size: 18,)
        : const Icon(FontAwesomeIcons.eyeSlash,size: 18,);
  }

  GlobalKey<FormState> formState = GlobalKey();
  validator(
    String Routename, {
    required String password,
    required String emailAddress,
  }) async {
    if (formState.currentState!.validate()) {
      try {
        isLoading.value = true;
        update();
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
        isLoading.value = false;
        update();

        SendEmailVerify(userCredential: credential).cekVerfiy();
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        update();

        if (e.code == 'wrong-password') {
          return Get.defaultDialog(
              title: 'Error',
              content: const Column(
                children: [
                  Icon(
                    FontAwesomeIcons.x,
                    color: Colors.red,
                  ),
                  Text('The password provided is too weak.'),
                ],
              ));
        } else if (e.code == 'user-not-found') {
          return Get.defaultDialog(
              title: 'Error',
              content: const Column(children: [
                Icon(
                  FontAwesomeIcons.x,
                  color: Colors.red,
                ),
                Text('The account already exists.')
              ]));
        } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
          return Get.defaultDialog(
              title: 'Error',
              content: const Column(children: [
                Icon(
                  FontAwesomeIcons.x,
                  color: Colors.red,
                ),
                Text('Invalid login credentials')
              ]));
        } else {
          return Get.defaultDialog(
              title: 'Error',
              content: Column(children: [
                const Icon(
                  FontAwesomeIcons.x,
                  color: Colors.red,
                ),
                Text(e.code.toString())
              ]));
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
