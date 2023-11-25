// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zosr/core/shared/text_style.dart';

// ignore: must_be_immutable
class CatgrayItem extends StatelessWidget {
  String title;
  void Function() onTap;
  CatgrayItem({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              blurRadius: 0.2,
              spreadRadius: 1,
              color: Color.fromARGB(49, 0, 0, 0))
        ], borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: AppStyleText.textStyle_22,
            ),
          ],
        ),
      ),
    );
  }
}
