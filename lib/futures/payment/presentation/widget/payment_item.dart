// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:zosr/core/constant/colors.dart';
import 'package:svg_flutter/svg.dart';

// ignore: must_be_immutable
class PaymentItem extends StatefulWidget {
  String image;
  bool isActive;
  PaymentItem({
    Key? key,
    this.isActive = false,
    required this.image,
  }) : super(key: key);

  @override
  State<PaymentItem> createState() => _PaymentItemState();
}

class _PaymentItemState extends State<PaymentItem> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 120,
      height: 80,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                spreadRadius: 2,
                blurRadius: 1,
                color: widget.isActive == true
                    ? Colors.green.withOpacity(0.7)
                    : Colors.white)
          ],
          border: Border.all(
              color: widget.isActive == true ? Colors.green : ColorApp.graey),
          borderRadius: BorderRadius.circular(16)),
      child: SvgPicture.asset(
        widget.image,
      ),
    );
  }
}
