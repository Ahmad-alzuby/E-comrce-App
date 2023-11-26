// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names, non_constant_identifier_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:zosr/core/constant/routersName.dart';
import 'package:zosr/futures/auth/view/manger/checkEmailControlaer.dart';
import 'package:zosr/futures/auth/view/manger/cheekConfiremPassword.dart';
import 'package:zosr/servers/serviers.dart';

class SignUpControaller extends GetxController {
  Rx<bool> isLoading = false.obs;
  MYServices myServices = Get.find();
  UserCredential? user;
  SignUpControaller({
    @required this.user,
  });
  GlobalKey<FormState> formState = GlobalKey();
    Rx<Icon> iconsPassword = const Icon(FontAwesomeIcons.eyeSlash , size: 18,).obs;
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
  validator(
      {required String Routename,
      required String Email,
      required String Pass,
      required String confermpass,
      required String Name}) async {
    if (formState.currentState!.validate() &&
        CheekConfermPaasword().Cheek(Pass, confermpass) == true) {
      try {
        isLoading.value = true;
        update();
        UserCredential credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: Email,
          password: Pass,
        );

        user = credential;
        await MYServices.sharedPreferences.setString("Name", Name);
        await MYServices.sharedPreferences.setBool("Log", true);
        Get.offAndToNamed(AppRouter.login);
        SendEmailVerify(userCredential: credential).sendMassge(credential);
          isLoading.value =false;
          update();
    
      } on FirebaseAuthException catch (e) {
          isLoading.value =false;
          update();
        if (e.code == 'weak-password') {
          return Get.defaultDialog(
              title: 'Note',
              content: const Text('The password provided is too weak.'));
        } else if (e.code == 'email-already-in-use') {
          return Get.defaultDialog(
              title: 'Note',
              content:
                  const Text('The account already exists for that email.'));
        }
      }
    } else if (CheekConfermPaasword().Cheek(Pass, confermpass) == false) {
      return Get.defaultDialog(
          title: "Note", content: const Text("The Password Not The Seem"));
    }
  }

  @override
  void dispose() {
    dispose();
    super.dispose();
  }
}
