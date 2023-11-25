// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:zosr/futures/home/data/models/prodect.dart';

class CRUD {
  CollectionReference firebaseFirestore =
      FirebaseFirestore.instance.collection("prodects");
  create(ProdectModel data, String userName) async {
    try {
      await firebaseFirestore.add({
        'title': data.title,
        'brand': data.brand,
        'category': data.category,
        'description': data.description,
        'images': data.images,
        'price': data.price,
        'thumbnail': data.thumbnail,
        'publish_name': userName
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
