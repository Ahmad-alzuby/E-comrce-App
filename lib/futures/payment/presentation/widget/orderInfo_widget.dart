// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderInfoItem extends StatelessWidget {
  String infoName;
  dynamic value;
  TextStyle textStyle;

  OrderInfoItem({
    Key? key,
    required this.textStyle,
    required this.infoName,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          infoName,
          textAlign: TextAlign.center,
          style: textStyle,
        ),
        Text(
          value is int ?   "$value" : " \$ $value",
          textAlign: TextAlign.center,
          style: textStyle,
        ),
      ],
    );
  }
}
