// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zosr/core/constant/colors.dart';
import 'package:zosr/core/constant/imageAssets.dart';
import 'package:zosr/core/constant/routersName.dart';
import 'package:zosr/core/function/alertExitApp.dart';
import 'package:zosr/core/function/validInput.dart';
import 'package:zosr/core/shared/text_style.dart';
import 'package:zosr/futures/auth/view/manger/loginContrrolar.dart';
import 'package:zosr/futures/auth/view/manger/login_withe_google.dart';
import 'package:zosr/futures/auth/view/widget/custom_BTN_withe_loading.dart';
import 'package:zosr/futures/auth/view/widget/formField_widget.dart';
import 'package:zosr/futures/auth/view/widget/logoAuth.dart';
import 'package:zosr/futures/auth/view/widget/sign_up_app_bar_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    GoogleAutheraizationControllar googleAutheControllar =
        Get.put(GoogleAutheraizationControllar());
    LoginControllar loginControllar = Get.put(LoginControllar());
    return WillPopScope(
      onWillPop: alerExitApp,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40),
          child: Form(
            key: loginControllar.formState,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              children: [
                const AuthAppBarWidget(),
                const SizedBox(
                  height: 10,
                ),
                const LogoAuth(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Welcome_Back'.tr,
                  textAlign: TextAlign.center,
                  style: AppStyleText.textStyle_38.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 36,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'sign_in_body'.tr,
                  textAlign: TextAlign.center,
                  style: AppStyleText.textStyle_18
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormFiledWidget(
                    validator: (p0) {
                      return validinput(
                          max: 30, min: 10, tyype: 'email', val: p0 ?? '');
                    },
                    hintText: 'Enter Your Email',
                    icondata: const Icon(Icons.email_outlined),
                    label: 'Email',
                    textEditingController: emailcontroller),
                GetBuilder<LoginControllar>(
                  builder: (controller) => TextFormFiledWidget(
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
                      textEditingController: passwordcontroller),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRouter.forgitPasswordScreen);
                  },
                  child: Text(
                    "ForgetPaasword".tr,
                    textAlign: TextAlign.end,
                    style: AppStyleText.textStyle_18
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<LoginControllar>(
                  builder: (controller) => 
                   CoustemBtnWitheLoading(
                isLoading: controller.isLoading.value,
                    function: () async {
                      return await controller.validator(AppRouter.homeScreen,
                          emailAddress: emailcontroller.text,
                          password: passwordcontroller.text);
                    },
                    content: 'login'.tr,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        return await googleAutheControllar.signIn();
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(ImageAssets.kGoogle),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont Have Account".tr,
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                      onTap: () {
                        Get.offAndToNamed(AppRouter.signUp);
                      },
                      child: Text(
                        "sign up now".tr,
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
    );
  }
}
