import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zosr/core/constant/routersName.dart';

import 'package:zosr/futures/payment/presentation/widget/ThankYouCard.dart';
import 'package:zosr/futures/payment/presentation/widget/appBar.dart';
import 'package:zosr/futures/payment/presentation/widget/chekItem.dart';
import 'package:zosr/futures/payment/presentation/widget/dashLine.dart';
import 'package:zosr/futures/search/presentation/widget/search_app_bar_widget.dart';

class SuccessPayScreeen extends StatelessWidget {
   const SuccessPayScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return WillPopScope(
      
      onWillPop: ()  {
         Get.toNamed(AppRouter.homeScreen);
         return Future(() => true);
      },
      child: Scaffold(
        body: Column(
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(onPressed: (){
           
                  Get.toNamed(AppRouter.homeScreen);
                
              },icon: const Icon(Icons.arrow_back)),
                title: const Text(""),
                actions: const [],
             ),
            Expanded(
              child: Transform.translate(
                offset: const Offset(0, -16),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const ThankYouCard(),
                      Positioned(
                          bottom: h * 0.22,
                          right: 0,
                          left: 0,
                          child: const CoustemDashLine()),
                      Positioned(
                          right: h * 0.3512,
                          bottom: h * 0.2,
                          child: const CircleAvatar(
    backgroundColor: Color.fromARGB(255, 50, 50, 50),                        )),
                      Positioned(
                          left: h * 0.3512,
                          bottom: h * 0.2,
                          child: const CircleAvatar(
    backgroundColor: Color.fromARGB(255, 50, 50, 50),                        
                          )),
                      const Positioned(
                        left: 0,
                        right: 0,
                        top: -50,
                        child: CustomChekItem(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
