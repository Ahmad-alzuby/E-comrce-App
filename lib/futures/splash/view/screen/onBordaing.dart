// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zosr/futures/splash/view/manger/controllaerPageView.dart';
import 'package:zosr/futures/splash/view/widget/Coustem_dot_widget.dart';
import 'package:zosr/futures/splash/view/widget/body_onBorading.dart';
import 'package:zosr/futures/splash/view/widget/coustem_button_widget.dart';

import '../../data/staic/static.dart';

class OnBoardingScreen extends GetView<PageViewControllar> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();

    PageViewControllar pageViewControllar = Get.put(PageViewControllar());

    return Scaffold(
        body: Column(
      children: [
        const SizedBox(height: 40),
        Expanded(
          flex: 3,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
            onPageChanged: (pageNumber) {
              pageViewControllar.onPageChange(currentPageNumber: pageNumber);
            },
            controller: pageController,
            itemCount: onBoardingList.length,
            itemBuilder: (context, index) {
              return Expanded(
                flex: 1,
                child: SafeArea(
                  child: BodyOnBordaingWidget(index),
                ),
              );
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              CoustemDotWidget(pageController: pageController),
              const SizedBox(
                height: 60,
              ),
              // ignore: missing_required_param
              CoustemButtonWidget(pageController: pageController),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  pageViewControllar.skip(pageController);
                },
                child: Text(
                  'skip'.tr,
                  style: const TextStyle(fontSize: 20, ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
