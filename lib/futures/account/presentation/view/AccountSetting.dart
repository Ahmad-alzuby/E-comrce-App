// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zosr/core/localizaton/localization_controllaer.dart';
import 'package:zosr/core/shared/text_style.dart';
import 'package:zosr/futures/account/presentation/widget/change_image_widget.dart';
import 'package:zosr/futures/account/presentation/widget/change_them_widget.dart';
import 'package:zosr/futures/account/presentation/widget/log_out_widget.dart';
import 'package:zosr/futures/auth/view/manger/login_withe_google.dart';
import 'package:zosr/futures/home/presentation/manger/homeControolar.dart';
import 'package:zosr/servers/serviers.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControolar(CategrayName: ''));
    Get.put(LocaleController());

    GoogleAutheraizationControllar autheraizationControllar =
        Get.put(GoogleAutheraizationControllar());

    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: ChangeImageWidget(),
            ),
            Text(
              MYServices.sharedPreferences.getString('Name') ??
                  'user'.toLowerCase(),
              style: AppStyleText.textStyle_22,
            ),
            const ChangeThemWidget(),
            const Spacer(),
            LogOutWidget(autheraizationControllar: autheraizationControllar),
            const SizedBox(
              height: 60,
            )
          ]),
        ),
      ),
    );
  }
}
