// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:zosr/core/shared/text_style.dart';

AppBar appbar({required String title, required Function function, required Color backgroundColor}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    centerTitle: true,
    leading: IconButton(
        onPressed: () {
          function();
        },
        icon: const Icon(
          Icons.arrow_back_outlined,
          color: Colors.black,
          size: 40,
        )),
    title: Text(
      title,
      style: AppStyleText.textStyle_25,
    ),
  );
}
