// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zosr/core/localizaton/localization_controllaer.dart';
import 'package:zosr/futures/language/view/widget/langFlagAndName_widget.dart';
import 'package:zosr/servers/serviers.dart';

class ItemLanguageWidget extends StatefulWidget {
  const ItemLanguageWidget({
    super.key,
  });

  @override
  State<ItemLanguageWidget> createState() => _ItemLanguageWidgetState();
}

class _ItemLanguageWidgetState extends State<ItemLanguageWidget> {
  String? groubValue;
  MYServices myServices = Get.put(MYServices());
  LocaleController localeController = Get.put(LocaleController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LangFlagAndName(
          name: 'Arabic',
          langeCode: 'ar',
          flag: 'assets/images/ar.png',
        ),
        LangFlagAndName(
          name: 'English',
          langeCode: 'en',
          flag: 'assets/images/en.png',
        ),
      ],
    );
  }
}
