// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zosr/core/constant/colors.dart';

// ignore: must_be_immutable
class CoustemBtnWitheLoading extends StatelessWidget {
  Function? function;
  String content;
  bool isLoading;
  Color? backgroundColor;
  CoustemBtnWitheLoading({
    required this.isLoading,
    Key? key,
    @required this.function,
    this.backgroundColor,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorApp.blue,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(73, 0, 0, 0),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(0, 1))
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          )),
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      backgroundColor ?? ColorApp.blue)),
              onPressed: () {
                if (function != null) {
                  // ignore: void_checks
                  return function!();
                }
              },
              child: isLoading == false
                  ? Text(
                      content.tr,
                      style: const TextStyle(fontSize: 20),
                    )
                  : CircularProgressIndicator(
                      color: ColorApp.white,
                      strokeWidth: 1.2,
                    ))),
    );
  }
}
