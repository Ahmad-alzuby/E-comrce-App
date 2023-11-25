import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zosr/core/constant/routersName.dart';
import 'package:zosr/core/function/alertExitApp.dart';
import 'package:zosr/core/shared/text_style.dart';
import 'package:zosr/futures/language/view/widget/itemLang.dart';
import 'package:zosr/futures/splash/view/manger/controllaerPageView.dart';
import 'package:zosr/futures/splash/view/widget/coustem_button_widget.dart';

class LangScreen extends StatefulWidget {
  const LangScreen({super.key});

  @override
  State<LangScreen> createState() => _LangScreenState();
}

class _LangScreenState extends State<LangScreen> {
  // LocaleController localeController = Get.put(LocaleController());
  String? country = 'en';

  @override
  Widget build(BuildContext context) {
    // Get.put(PageViewControllar());
    Get.put(PageViewControllar());
    return WillPopScope(
      onWillPop: alerExitApp,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                    textAlign: TextAlign.center,
                    'Choose\n Language',
                    style: AppStyleText.textStyle_38),
              ),
              const SizedBox(
                height: 30,
              ),
              const ItemLanguageWidget(),
              const SizedBox(
                height: 40,
              ),
              // ignore: missing_required_param
              CoustemButtonWidget(function: () {
                return Get.offNamed(AppRouter.onboarding);
              })
            ],
          ),
        ),
      ),
    );
  }
}
