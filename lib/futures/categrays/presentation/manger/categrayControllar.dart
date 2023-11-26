// ignore_for_file: file_names

import 'package:get/get.dart';

class CategrayConttrollar extends GetxController {
  RxBool isInCatgray = false.obs;
  RxString catName = ''.obs;
  RxBool isLoading = false.obs;
  updateCategrayName() {
    isInCatgray = true.obs;
    update();
  }

  isLoaing(bool isLoad) {
    isLoading = isLoad.obs;
    update();
  }

  cangeName(String categrayName) {
    catName = categrayName.obs;
    update();
  }
}
