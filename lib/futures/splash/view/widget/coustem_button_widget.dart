// ignore_for_file: public_member_api_docs, sort_ ructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zosr/core/shared/text_style.dart';
import 'package:zosr/futures/splash/data/staic/static.dart';
import 'package:zosr/futures/splash/view/manger/controllaerPageView.dart';

// ignore: must_be_immutable
class CoustemButtonWidget extends StatelessWidget {
  PageController? pageController;
  String? text;
  PageViewControllar pageViewControllar = Get.find();
  Function? function;
  CoustemButtonWidget({
    Key? key,
    @required this.text,
    @required this.function,
    @required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(73, 0, 0, 0),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(0, 1))
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          )),
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: ElevatedButton(
              onPressed: () {
                if (pageController == null) {
                  function!();
                } else {
                  pageViewControllar.next(pageViewControllar.pageNumber,
                      onBoardingList.length, pageController!);
                }
              },
              child: text == null
                  ? Text(
                      "btn".tr,
                      style: const TextStyle(fontSize: 20),
                    )
                  : Text(
                      text!,
                      style: AppStyleText.textStyle_22,
                    ))),
    );
  }
}
