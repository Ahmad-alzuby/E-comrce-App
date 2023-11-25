import 'dart:async';

import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:zosr/core/constant/const.dart';
import 'package:zosr/futures/home/data/models/prodect.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MYServices extends GetxService {
  @override
  void onInit() async {
    super.onInit();
    sharedPreferences = await SharedPreferences.getInstance();
  }

  String grounValueLocal = '';
  static late SharedPreferences sharedPreferences;

  Future<MYServices> inits() async {
    await Hive.openBox<ProdectModel>(kfavoriteBox);
    await Hive.openBox(kNumOfprodect);

    return this;
  }

  initialServices() async {
    sharedPreferences = await SharedPreferences.getInstance();

    Get.put(MYServices());

    await MYServices().inits();
  }
}
