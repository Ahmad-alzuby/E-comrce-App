// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:zosr/core/constant/colors.dart';
import 'package:zosr/core/shared/text_style.dart';
import 'package:zosr/futures/payment/presentation/widget/orderInfo_widget.dart';
import 'package:zosr/futures/payment/presentation/widget/thankYouInfo_widget.dart';
import 'package:svg_flutter/svg.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
          color: ColorApp.cardColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0, right: 22, left: 22),
        child: Column(
          children: [
            Text(
              "Thank you!",
              style: AppStyleText.textStyle_25,
            ),
            Text(
              "Your transaction was successful",
              style: AppStyleText.textStyle_18,
            ),
            const SizedBox(
              height: 22,
            ),
            ThankYouInfo(
                title: 'Date',
                vale:
                    "${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day} "),
            ThankYouInfo(
                title: 'Time',
                vale: DateFormat('hh:mm a').format(DateTime.now())),
            ThankYouInfo(title: 'To', vale: "Ahmad Alzuby"),
            const Divider(
              height: 60,
              thickness: 2,
            ),
       
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(FontAwesomeIcons.barcode, size: 64 , color: Colors.black) ,
                Container(
                  height: 58,
                  width: 113,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.green)),
                  child: Center(
                    child: Text(
                      'Paid',
                      style: AppStyleText.textStyle_25
                          .copyWith(color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
          ],
        ),
      ),
    );
  }
}
