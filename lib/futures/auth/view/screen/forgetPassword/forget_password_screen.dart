// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, empty_catches

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zosr/core/function/validInput.dart';
import 'package:zosr/core/shared/text_style.dart';
import 'package:zosr/futures/auth/view/screen/forgetPassword/send_password_method.dart';
import 'package:zosr/futures/auth/view/widget/custom_btn.dart';
import 'package:zosr/futures/auth/view/widget/formField_widget.dart';

// ignore: camel_case_types
class ForgitPassword_screen extends StatelessWidget {
  const ForgitPassword_screen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    GlobalKey<FormState> emailKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        title: Text('ForgetPaasword'.tr,
            style: AppStyleText.textStyle_22.copyWith()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40),
        child: Form(
          key: emailKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Cheek Email'.tr,
                textAlign: TextAlign.center,
                style: AppStyleText.textStyle_38
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 36),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'forget_password_body'.tr,
                textAlign: TextAlign.center,
                style: AppStyleText.textStyle_18
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 65,
              ),
              TextFormFiledWidget(
                  validator: (p0) {
                    return validinput(
                        max: 40, min: 10, tyype: 'email', val: p0!);
                  },
                  hintText: 'Enter Your Email'.tr,
                  icondata: const Icon(Icons.email_outlined),
                  label: 'Email'.tr,
                  textEditingController: emailcontroller),
              const SizedBox(
                height: 20,
              ),
              CoustemBtnWidget(
                function: () {
                  if (emailKey.currentState!.validate()) {
                    try {
                      return sendPasswordResetEmail(emailcontroller.text);
                    } catch (e) {}
                  }
                },
                text: 'Cheek'.tr,
              )
            ],
          ),
        ),
      ),
    );
  }
}
