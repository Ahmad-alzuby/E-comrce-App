// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zosr/core/constant/colors.dart';

// ignore: must_be_immutable
class CoustemBtnWidget extends StatelessWidget {
  Function? function;
  String? text;
  IconData? icon;
  Color? backgroundColor;
  CoustemBtnWidget({
    this.icon,
    Key? key,
    @required this.function,
    this.backgroundColor,
    required this.text,
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
              child: icon == null
                  ? Text(
                      text?.tr ?? '',
                      style: const TextStyle(fontSize: 20),
                    )
                  : Icon(icon))),
    );
  }
}
