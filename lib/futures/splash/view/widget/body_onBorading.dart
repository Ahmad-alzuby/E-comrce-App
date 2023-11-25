// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:zosr/core/shared/text_style.dart';
import 'package:zosr/futures/splash/data/staic/static.dart';

Expanded BodyOnBordaingWidget(int index) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('${onBoardingList[index].title}',
            style: AppStyleText.textStyle_22),
        const SizedBox(
          height: 80,
        ),
        SizedBox(
       height: 230,
       width: 230,
          child: SvgPicture.asset(
            "${onBoardingList[index].image}",
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        Text('${onBoardingList[index].body}',
            textAlign: TextAlign.center, style: AppStyleText.textStyle_18),
      ],
    ),
  );
}
