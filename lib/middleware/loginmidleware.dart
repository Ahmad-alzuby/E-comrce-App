// ignore: implementation_imports
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:zosr/core/constant/routersName.dart';
import 'package:zosr/servers/serviers.dart';

class IsloginMiddleware extends GetMiddleware {
  MYServices myServices = Get.find();
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (MYServices.sharedPreferences.getBool("Log") == true) {
      return RouteSettings(name: AppRouter.homeScreen, arguments: const []);
    } else if (MYServices.sharedPreferences.getBool("Log") == false) {
      return RouteSettings(name: AppRouter.login, arguments: const []);
    }
    return null;
  }
}
