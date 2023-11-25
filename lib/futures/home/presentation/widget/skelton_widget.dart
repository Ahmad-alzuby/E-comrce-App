import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SkeltonWidget extends StatelessWidget {
  double higet;
  double width;
  SkeltonWidget({
    Key? key,
    required this.higet,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: higet,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
    );
  }
}
