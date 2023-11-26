import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zosr/core/constant/routersName.dart';
import 'package:zosr/futures/auth/view/manger/login_withe_google.dart';
import 'package:zosr/futures/auth/view/widget/custom_BTN_withe_loading.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({
    super.key,
    required this.autheraizationControllar,
  });

  final GoogleAutheraizationControllar autheraizationControllar;

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    return CoustemBtnWitheLoading(
      isLoading: isLoading,
      function: () async {
        try {
          isLoading = true;
          await autheraizationControllar.logout();
          Get.toNamed(AppRouter.login);
        } catch (e) {
          return;
        }
      },
      content: 'logout'.tr,
      backgroundColor: Colors.red[900],
    );
  }
}
