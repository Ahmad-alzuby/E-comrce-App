// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alerExitApp() {
  Get.defaultDialog(
      title: 'تنبية',
      middleText: 'هل تريد الخروج من التطبيق',
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: const Text('نعم')),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('لا'))
      ]);
  return Future.value(true);
}
