// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:zosr/futures/home/data/models/prodect.dart';

class Api {
  Dio dio = Dio();

  Future<Response> post({
    required body,
    required String url,
    required String token,
    String? contentType,
  }) async {
    var respons = await dio.post(url,
        data: body,
        options: Options(
            contentType: contentType,
            headers: {'Authorization': 'Bearer $token'}));
    return respons;
  }

  Future<List<ProdectModel>> GetData(String CatgrayName) async {
    try {
      BaseOptions baseOptions = BaseOptions(
        baseUrl: 'https://dummyjson.com/',
      );
      dio = Dio(baseOptions);
      List<dynamic> data = (await dio.get(CatgrayName)).data['products'];

      List<ProdectModel> d = data.map((value) {
        return ProdectModel.fromJson(value);
      }).toList();
      return d;
    } catch (e) {
      return await Get.defaultDialog(
          title: "Note", content: const Text("No Internet try Again Later"));
    }
  }
}
