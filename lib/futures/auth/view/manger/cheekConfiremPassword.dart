// ignore_for_file: file_names, non_constant_identifier_names

import 'package:get/get.dart';

class CheekConfermPaasword extends GetxController {
  bool Cheek(String pass, String confermpass) {
    if (pass == confermpass) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    dispose();
    super.dispose();
  }
}
