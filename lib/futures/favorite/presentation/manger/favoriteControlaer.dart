// ignore_for_file: file_names, empty_catches, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:zosr/core/constant/const.dart';
import 'package:zosr/futures/home/data/models/prodect.dart';
import 'package:zosr/servers/serviers.dart';

class FavoriteControllar extends GetxController {
 
  MYServices myServices = Get.find();
  Rx<Color> color = Colors.blue.obs;
  RxInt countProdect = 1.obs;
  addProdect(
    ProdectModel prodect,
  ) async {
bool  isFav = await chechIfFavoriteAlready(prodect);
update();
if (isFav == true) {
 
    try {
        color = Colors.blue.obs;
        await Hive.box<ProdectModel>(kfavoriteBox).delete(prodect.id);
        update();
        return true;
      } catch (e) {}
     
} else if(isFav == false){

    try {
        await Hive.box<ProdectModel>(kfavoriteBox).put(prodect.id, prodect);

        if (Hive.box<ProdectModel>(kfavoriteBox).values.contains(prodect)) {
          color.value = Colors.red;
        } else {
          color.value = Colors.blue;
        }
        update();
        
      } catch (e) {
        Get.defaultDialog(content: const Text(''), title: e.toString());
      }
}
  }
 Future<bool> chechIfFavoriteAlready(
    ProdectModel prodect,
  )async {
await Hive.box(kNumOfprodect).put(prodect.id, 1);

    if (Hive.box<ProdectModel>(kfavoriteBox).containsKey(prodect.id)) {
    return true;
    } else {
       
  
    return false;}
  }

  deletProdct(ProdectModel prodect, int index) async {
    try {
      Get.closeCurrentSnackbar();
      await Hive.box(kNumOfprodect).delete(
        prodect.id,
      );

      await Hive.box<ProdectModel>(kfavoriteBox).delete(prodect.id!);
      update();
    } catch (e) {}
  }

  addMoreIntForProdect(ProdectModel prodec) async {
    await Hive.box(kNumOfprodect)
        .put(prodec.id, Hive.box(kNumOfprodect).get(prodec.id) + 1);

    update();
  }

  MinceOneForProdect(ProdectModel prodec) async {
    if (Hive.box(kNumOfprodect).get(prodec.id) == 1) {
      Hive.box<ProdectModel>(kfavoriteBox).delete(prodec.id); 
      update();     
    }
    await Hive.box(kNumOfprodect)
        .put(prodec.id, Hive.box(kNumOfprodect).get(prodec.id) - 1);

    update();
  }
  @override
  void dispose() {
dispose();
    super.dispose();
  }
}
