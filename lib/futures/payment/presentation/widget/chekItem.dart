// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:zosr/core/constant/colors.dart';

class CustomChekItem extends StatelessWidget {
  const CustomChekItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: ColorApp.cardColor,
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.green,
        child: Icon(
          Icons.check,
          color: ColorApp.white,
          size: 50,
        ),
      ),
    );
  }
}
