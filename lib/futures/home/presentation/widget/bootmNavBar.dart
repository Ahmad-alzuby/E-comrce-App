// ignore_for_file: file_names

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:zosr/core/localizaton/localization_controllaer.dart';
import 'package:zosr/futures/home/presentation/manger/homeControolar.dart';

class BootmnavigatorCoutem extends StatefulWidget {
  const BootmnavigatorCoutem({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BootmnavigatorCoutemState createState() => _BootmnavigatorCoutemState();
}

class _BootmnavigatorCoutemState extends State<BootmnavigatorCoutem>
    with TickerProviderStateMixin {
  HomeControolar homeControolar = Get.find();
  LocaleController localeController = Get.find();

  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      homeControolar.changePage(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    AnimationController(
      vsync: this,
      value: 1,
      duration: const Duration(milliseconds: 100),
    );
    return GetBuilder<HomeControolar>(
      builder: (controller) => BottomAppBar(
          child: GetBuilder<LocaleController>(
        builder: (controller) => DotNavigationBar(
          dotIndicatorColor: Colors.transparent,
          selectedItemColor: controller.brightness.value == Brightness.dark
              ? Colors.white
              : Colors.black,
          paddingR: const EdgeInsets.all(0),
          backgroundColor: controller.brightness.value == Brightness.dark
              ? Colors.transparent
              : Colors.transparent,
          margin: const EdgeInsets.only(left: 10, right: 10),
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          unselectedItemColor: controller.brightness.value != Brightness.dark
              ? const Color.fromARGB(251, 183, 183, 183)
              : Colors.black,
          splashBorderRadius: 50,
          // enableFloatingNavBar: false,
          onTap: _handleIndexChanged,
          items: [
            /// Home
            DotNavigationBarItem(
              icon: const Icon(Icons.home_sharp),
            ),

            DotNavigationBarItem(
              icon: const Icon(Icons.favorite),
            ),

            /// Search
            DotNavigationBarItem(
              icon: const Icon(Icons.search),
            ),

            /// Profile
            DotNavigationBarItem(
              icon: const Icon(Icons.category_outlined),
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.person),
            ),
          ],
        ),
      )),
    );
  }
}

enum _SelectedTab { home, favorite, search, person, map }
