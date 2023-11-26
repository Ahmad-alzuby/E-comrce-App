// ignore_for_file: public_member_api_docs, sort_ ructors_first, file_names, non_constant_identifier_names
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zosr/futures/auth/view/manger/login_withe_google.dart';
import 'package:zosr/futures/account/presentation/view/AccountSetting.dart';
import 'package:zosr/futures/favorite/presentation/view/favorite_Screen.dart';
import 'package:zosr/futures/categrays/presentation/view/categary_screen.dart';
import 'package:zosr/futures/search/presentation/view/search_screen.dart';
import 'package:zosr/futures/home/presentation/widget/home_body.dart';
import 'package:zosr/servers/serviers.dart';

class HomeControolar extends GetxController {
  String CategrayName;
  RxInt? currenPageNumber = 0.obs;
Rx<int> ProdectNumber = 20.obs;
  List<Widget> pages = [
    const HomeBody(),
    // ignore: missing_required_param
    FavoriteScreen(),
    const SearchScreen(),
    const CategrayScreen(),
    const AccountSettingScreen(),
  ];
  File? file;
  RxString imagePath = ''.obs;
  HomeControolar({
    this.currenPageNumber,
    required this.CategrayName,
  });
  uplodImagesharedpref(
    ImageSource imageSource,
  ) async {
  
        Get.put(GoogleAutheraizationControllar());
    final image = await ImagePicker().pickImage(source: imageSource);
    if (image == null) return;
    File? img = File(image.path);
    imagePath = img.path.obs;

    MYServices.sharedPreferences.setString('image', imagePath.value);
    update();
  }
updateNumber() {
   ProdectNumber.value +=5;
  update();
}
  uplodImageFireStorge(
    ImageSource imageSource,
  ) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);

      if (image == null) return;
      File file = File(image.path);
      Reference refrencs = FirebaseStorage.instance.ref('i.jpg');

      await refrencs.putFile(file);
      update();
    } catch (e) {
      return;
    }
  }

  changePage(int index) {
    currenPageNumber = index.obs;
    update();
  }
}
