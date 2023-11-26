// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zosr/core/shared/text_style.dart';
import 'package:zosr/futures/home/presentation/manger/homeControolar.dart';
import 'package:zosr/futures/favorite/presentation/view/favorite_Screen.dart';
import 'package:zosr/servers/serviers.dart';

// ignore: must_be_immutable
class AppBarCoustem extends StatelessWidget {
  AppBarCoustem({
    super.key,
    required this.myServices,
    required this.homeControolar,
  });

  MYServices myServices;
  HomeControolar homeControolar;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        trailing: IconButton(
            onPressed: () {
              Get.to(FavoriteScreen(index: 0));
            },
            icon: const Icon(Icons.shopping_cart_outlined)),
        title: Text(
          "welcome".tr,
          style: AppStyleText.textStyle_22,
        ),
        subtitle: Row(
          children: [
            Text(
              MYServices.sharedPreferences.getString('Name') ??
                  'user'.toLowerCase(),
              style: AppStyleText.textStyle_22,
            ),
            const SizedBox(
              width: 5,
            ),
            GetBuilder<HomeControolar>(
              builder: (controller) => GestureDetector(
                  onTap: () {
                    Get.defaultDialog(
                        title: '',
                        content: MYServices.sharedPreferences
                                    .getString('image') ==
                                ''
                            ? Image.network(
                                "${MYServices.sharedPreferences.getString('googleImage')}")
                            : Image.file(File(
                                "${MYServices.sharedPreferences.getString('image')}")));
                  },
                  child: MYServices.sharedPreferences.getString('image') == ''
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(
                              "${MYServices.sharedPreferences.getString('googleImage')}"),
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(File(
                              "${MYServices.sharedPreferences.getString("image")}")),
                        )),
            ),
          ],
        ));
  }
}
