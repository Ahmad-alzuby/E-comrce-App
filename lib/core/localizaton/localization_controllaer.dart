// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:zosr/core/constant/theem.dart';
import 'package:zosr/servers/serviers.dart';

class LocaleController extends GetxController {
  MYServices myServices = Get.find();
  String Lang_them = engilshTheem;
  Locale? language;
  late Rx<Brightness> brightness;
  changeLang(String langCode) async {
    Locale locale = Locale(langCode);
    MYServices.sharedPreferences.setString('lang', langCode);
    Lang_them = langCode == 'ar' ? arabicTheem : engilshTheem;
    Get.updateLocale(locale);
  }

  Rx<Brightness> checkThem() {
    if (MYServices.sharedPreferences.getBool('IsDarkMode').obs == true.obs) {
      return Brightness.dark.obs;
    } else if (MYServices.sharedPreferences.getBool('IsDarkMode').obs ==
        false.obs) {
      Brightness.light.obs;
      return Brightness.light.obs;
    }
    return SchedulerBinding.instance.platformDispatcher.platformBrightness.obs;
  }

  chngeThem(Rx<Brightness> themeData) async {
    if (themeData.value == Brightness.dark) {
      brightness.value = Brightness.dark;
      MYServices.sharedPreferences.setBool('IsDarkMode', true);
      update();
    } else {
      brightness.value = Brightness.light;

      MYServices.sharedPreferences.setBool('IsDarkMode', false);
      update();
    }
  }

  @override
  void onInit() {
    brightness = MYServices.sharedPreferences.getBool('IsDarkMode') == true
        ? Brightness.dark.obs
        : Brightness.light.obs;

    super.onInit();
    String sharedLocal =
        MYServices.sharedPreferences.getString('lang').toString();
    if (sharedLocal == 'ar') {
      language = const Locale('ar');
      Lang_them = arabicTheem;
    } else if (sharedLocal == 'en') {
      Lang_them = engilshTheem;

      language = const Locale('en');
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
  }
}
