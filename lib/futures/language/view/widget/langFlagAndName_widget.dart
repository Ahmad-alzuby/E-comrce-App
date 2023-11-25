// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:zosr/core/constant/colors.dart';
import 'package:zosr/core/localizaton/localization_controllaer.dart';
import 'package:zosr/servers/serviers.dart';

// ignore: must_be_immutable
class LangFlagAndName extends StatelessWidget {
  String name;
  String langeCode;
  String flag;
  LangFlagAndName({
    Key? key,
    required this.name,
    required this.langeCode,
    required this.flag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MYServices myServices = Get.put(MYServices());
    LocaleController localeController = Get.put(LocaleController());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          MYServices.sharedPreferences.setString('lang', langeCode);
          localeController.changeLang(langeCode);

          myServices.grounValueLocal = name;
        },
        child: Container(
          height: 80,
          decoration: BoxDecoration(boxShadow: [
            myServices.grounValueLocal == name
                ? BoxShadow(
                    color: ColorApp.primary,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 0),
                  )
                : const BoxShadow(
                    color: Color.fromARGB(63, 81, 81, 81),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
          ], borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: ListTile(
              trailing: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  height: 110,
                  width: 110,
                  fit: BoxFit.fill,
                  flag,
                ),
              ),
              title: Text(
                textAlign: TextAlign.end,
                name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                value: name,
                groupValue: myServices.grounValueLocal,
                onChanged: (va) {
                  MYServices.sharedPreferences.setString('lang', langeCode);

                  localeController.changeLang(langeCode);

                  myServices.grounValueLocal = va!;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
