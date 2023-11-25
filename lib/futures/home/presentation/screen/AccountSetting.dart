// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zosr/core/constant/colors.dart';
import 'package:zosr/core/constant/routersName.dart';
import 'package:zosr/core/localizaton/localization_controllaer.dart';
import 'package:zosr/core/shared/text_style.dart';
import 'package:zosr/futures/auth/view/manger/login_withe_google.dart';

import 'package:zosr/futures/auth/view/widget/custom_BTN_withe_loading.dart';

import 'package:zosr/futures/home/presentation/manger/homeControolar.dart';
import 'package:zosr/servers/serviers.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControolar(CategrayName: ''));
    Get.put(LocaleController());
    bool isLoading = false;

    GoogleAutheraizationControllar autheraizationControllar =
        Get.put(GoogleAutheraizationControllar());

    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            Center(
                child: GetBuilder<HomeControolar>(
              builder: (controller) => GestureDetector(
                  onTap: () async {
                    return await Get.defaultDialog(
                        title: "Chouse Image From",
                        content: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller
                                    .uplodImagesharedpref(ImageSource.gallery);
                              },
                              child: const ListTile(
                                title: Text("Gallary"),
                                leading: Icon(Icons.photo),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller
                                    .uplodImagesharedpref(ImageSource.camera);
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
            )),
            Text(
              MYServices.sharedPreferences.getString('Name') ??
                  'user'.toLowerCase(),
              style: AppStyleText.textStyle_22,
            ),
            GetBuilder<LocaleController>(
              builder: (controller) => controller.brightness.value ==
                      Brightness.light
                  ? AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                      width: 150,
                      child: AnimatedContainer(
                          duration: const Duration(microseconds: 500),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(ColorApp.graey)),
                            onPressed: () async {
                              await controller.chngeThem(Brightness.dark.obs);
                            },
                            child:   Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(Icons.dark_mode),
                                Text("dark mode".tr),
                              ],
                            ),
                          )),
                    )
                  : AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(249, 78, 77, 77))),
                          onPressed: () async {
                            await controller.chngeThem(Brightness.light.obs);
                          },
                          child:   AnimatedContainer(
duration: const Duration(milliseconds: 300),
                            width: 150,
                            child:   Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("light mode".tr),
                                const Icon(Icons.light_mode),
                              ],
                            ),
                          )),
                    ),
            ),
            const Spacer(),
            CoustemBtnWitheLoading(
              isLoading: isLoading,
              function: () async {
                try {
                  isLoading = true;
                  await autheraizationControllar.logout();
                  Get.toNamed(AppRouter.login);
                } catch (e) {
                  return;
                }
              },
              content: 'logout'.tr,
              backgroundColor: Colors.red[900],
            ),
            const Text("Desgin By : Ahmad Alzuby"),
            const SizedBox(
              height: 60,
            )
          ]),
        ),
      ),
    );
  }
}
