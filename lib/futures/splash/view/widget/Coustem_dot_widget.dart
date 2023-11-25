// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:zosr/core/constant/colors.dart';
import 'package:zosr/futures/splash/data/staic/static.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class CoustemDotWidget extends StatelessWidget {
  PageController pageController;
  CoustemDotWidget({
    required this.pageController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        child: SmoothPageIndicator(
            effect: WormEffect(
                activeDotColor: ColorApp.primary,
                dotColor: const Color.fromARGB(255, 137, 136, 136),
                dotHeight: 10,
                dotWidth: 20),
            controller: pageController,
            count: onBoardingList.length),
      ),
    ]);
  }
}
