// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
import 'package:zosr/core/constant/routersName.dart';
import 'package:zosr/futures/splash/data/staic/static.dart';
import 'package:zosr/servers/serviers.dart';

class PageViewControllar extends GetxController {
   
  int pageNumber = 0;

  next(int currentPage, int length, PageController pageController) async {
    currentPage++;
    if (currentPage == onBoardingList.length) {
      await MYServices.sharedPreferences.setString('First_Vist', '1');
      Get.offAndToNamed(AppRouter.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  onPageChange({required int currentPageNumber}) {
    pageNumber = currentPageNumber;
  }

  skip(PageController pageController) {
    pageController.animateToPage(onBoardingList.length - 1,
        curve: Curves.decelerate, duration: const Duration(milliseconds: 700));
  }

}
