import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zosr/core/constant/routersName.dart';
import 'package:zosr/servers/serviers.dart';

class MyMiddleware extends GetMiddleware {
  MYServices myServices = Get.find();
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (MYServices.sharedPreferences.getString('First_Vist') == '1') {
      return RouteSettings(
          name: AppRouter.cheekLoginScreen, arguments: const []);
    } else {
      return RouteSettings(name: AppRouter.langScreen);
    }
  }

  @override
  void onPageDispose() {
    onPageDispose();
    super.onPageDispose();
  }
}
