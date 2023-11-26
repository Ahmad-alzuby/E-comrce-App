import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:zosr/futures/home/presentation/manger/homeControolar.dart';
import 'package:zosr/servers/serviers.dart';

class ChangeImageWidget extends StatelessWidget {
  const ChangeImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControolar>(
      builder: (controller) => GestureDetector(
          onTap: () async {
            return await Get.defaultDialog(
                title: "Chouse Image From",
                content: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.uplodImagesharedpref(ImageSource.gallery);
                      },
                      child: const ListTile(
                        title: Text("Gallary"),
                        leading: Icon(Icons.photo),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.uplodImagesharedpref(ImageSource.camera);
                      },
                      child: const ListTile(
                        title: Text("Camera"),
                        leading: Icon(Icons.camera_alt_outlined),
                      ),
                    ),
                  ],
                ));
          },
          child: MYServices.sharedPreferences.getString('image') == ''
              ? CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                      "${MYServices.sharedPreferences.getString('googleImage')}"),
                )
              : CircleAvatar(
                  radius: 70,
                  backgroundImage: FileImage(File(
                      "${MYServices.sharedPreferences.getString("image")}")),
                )),
    );
  }
}
