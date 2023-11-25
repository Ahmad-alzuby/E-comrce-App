// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CoustemDashLine extends StatelessWidget {
  const CoustemDashLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
            30,
            (index) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(16)),
                      height: 2,
                    ),
                  ),
                )));
  }
}
