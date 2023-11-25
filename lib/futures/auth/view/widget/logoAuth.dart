// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:zosr/core/constant/imageAssets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        child: Image.asset(
          ImageAssets.kLogor,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
