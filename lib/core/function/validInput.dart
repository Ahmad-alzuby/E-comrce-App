// ignore_for_file: file_names

import 'package:get/get.dart';

validinput(
    {required String val,
    required int min,
    required int max,
    required String tyype}) {
  if (tyype == 'username') {
    {
      if (!GetUtils.isUsername(val)) {
        return "Not Valid UserName".tr;
      }
    }
  }
  if (tyype == 'email') {
    {
      if (!GetUtils.isEmail(val)) {
        return "Not Valid Email".tr;
      }
    }
  }
  if (val.length < min) {
    return "Can't Be less Then".tr;
  }
  if (val.isEmpty) {
    return "Can't Be  Empty".tr;
  }
  if (val.length > max) {
    return "Can't Be Larger Then".tr;
  }
}
