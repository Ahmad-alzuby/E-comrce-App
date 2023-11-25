import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zosr/core/constant/apiRoute.dart';
import 'package:zosr/core/constant/colors.dart';
import 'package:zosr/core/function/alertExitApp.dart';
import 'package:zosr/futures/auth/view/manger/login_withe_google.dart';
import 'package:zosr/futures/home/presentation/manger/homeControolar.dart';
import 'package:zosr/futures/home/presentation/widget/bootmNavBar.dart';
import 'package:zosr/futures/splash/view/manger/controllaerPageView.dart';
import 'package:zosr/servers/serviers.dart';

class HomwScreen extends StatefulWidget {
  const HomwScreen({super.key});

  @override
  State<HomwScreen> createState() => _HomwScreenState();
}

class _HomwScreenState extends State<HomwScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(PageViewControllar());

     Get.put(MYServices());
     
        Get.put(GoogleAutheraizationControllar());
    HomeControolar homeControolar =
        Get.put(HomeControolar(CategrayName: ApiEndBoint.all));

    return WillPopScope(
      onWillPop: alerExitApp,
      child: GetBuilder<HomeControolar>(
        builder: (controller) => Scaffold(
          extendBody: false,
          backgroundColor: ColorApp.white,
          body:
              homeControolar.pages[homeControolar.currenPageNumber?.value ?? 0],
          bottomNavigationBar: const BootmnavigatorCoutem(),
        ),
      ),
    );
  }
}
