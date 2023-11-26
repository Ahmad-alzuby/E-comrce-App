// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zosr/core/constant/colors.dart';
import 'package:zosr/core/constant/routersName.dart';
import 'package:zosr/core/function/alertExitApp.dart';
import 'package:zosr/core/function/validInput.dart';
import 'package:zosr/core/shared/text_style.dart';
import 'package:zosr/futures/auth/view/manger/signUp_contrrolar.dart';
import 'package:zosr/futures/auth/view/widget/custom_BTN_withe_loading.dart';
import 'package:zosr/futures/auth/view/widget/formField_widget.dart';
import 'package:zosr/futures/auth/view/widget/logoAuth.dart';
import 'package:zosr/futures/auth/view/widget/sign_up_app_bar_widget.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  // ignore: missing_required_param
  SignUpControaller signUpControaller = Get.put(SignUpControaller());
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController confermpass = TextEditingController();
    return WillPopScope(
      onWillPop: alerExitApp,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40),
          child: Form(
            key: signUpControaller.formState,
            child: GetBuilder<SignUpControaller>(
              builder: (controller) => ListView(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                children: [
                  const AuthAppBarWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  const LogoAuth(),
                  Text(
                    'Join Now!'.tr,
                    textAlign: TextAlign.center,
                    style: AppStyleText.textStyle_38
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 36),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormFiledWidget(
                      validator: (p0) {
                        return validinput(
                            max: 30, min: 4, tyype: 'username', val: p0!);
                      },
                      hintText: 'Enter Your  userName'.tr,
                      icondata: const Icon(Icons.person_2_outlined),
                      label: 'UserName'.tr,
                      textEditingController: nameController),
                  TextFormFiledWidget(
                      validator: (p0) {
                        return validinput(
                            max: 40, min: 10, tyype: 'email', val: p0!);
                      },
                      hintText: 'Enter Your Email'.tr,
                      icondata: const Icon(Icons.email_outlined),
                      label: 'Email'.tr,
                      textEditingController: emailController),
                  TextFormFiledWidget(
                      obscureText: controller.isShowPassowrd,
                      onpress: () async {
                        await controller.showPassword();
                      },
                      validator: (p0) {
                        return validinput(
                            max: 40, min: 8, tyype: 'passwrod', val: p0!);
                      },
                      hintText: 'Enter Your PassWord',
                      icondata: controller.iconsPassword.value,
                      label: 'password'.tr,
                      textEditingController: passController),
                  TextFormFiledWidget(
                      onpress: () async {
                        await controller.showPassword();
                      },
                      obscureText: controller.isShowPassowrd,
                      validator: (p0) {
                        return validinput(
                            max: 40, min: 8, tyype: 'password', val: p0 ?? '');
                      },
                      hintText: 'Enter Your PassWord',
                      icondata: controller.iconsPassword.value,
                      label: 'password'.tr,
                      textEditingController: passController),
                  const SizedBox(
                    height: 10,
                  ),
                  CoustemBtnWitheLoading(
                    isLoading: controller.isLoading.value,
                    function: () {
                      controller.validator(
                          Routename: AppRouter.cheekEmailScreen,
                          Name: nameController.text,
                          Email: emailController.text,
                          Pass: passController.text,
                          confermpass: confermpass.text);
                    },
                    content: 'login'.tr,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "already Have An Account".tr,
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () {
                          Get.offNamed(AppRouter.login);
                        },
                        child: Text(
                          "Login Now".tr,
                          textAlign: TextAlign.end,
                          style: TextStyle(color: ColorApp.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
