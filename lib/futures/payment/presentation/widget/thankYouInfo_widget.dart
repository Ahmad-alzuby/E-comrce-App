// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:zosr/core/shared/text_style.dart';

// ignore: must_be_immutable
class ThankYouInfo extends StatelessWidget {
  String title;
  String vale;
  ThankYouInfo({super.key, required this.title, required this.vale});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyleText.textStyle_18,
        ),
        Text(
          vale,
          style:
              AppStyleText.textStyle_18.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
