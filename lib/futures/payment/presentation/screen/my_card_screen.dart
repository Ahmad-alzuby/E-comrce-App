// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zosr/core/constant/colors.dart';

import 'package:zosr/core/shared/text_style.dart';

import 'package:zosr/futures/auth/view/widget/custom_BTN_withe_loading.dart';

import 'package:zosr/futures/payment/presentation/manger/payment_manger.dart';

import 'package:zosr/futures/payment/presentation/widget/appBar.dart';
import 'package:zosr/futures/payment/presentation/widget/orderInfo_widget.dart';

class my_cart_screen extends StatelessWidget {
  // ProdectModel prodectModel;
  const my_cart_screen({
    Key? key,
    // required this.prodectModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaymentManager paymentManager = Get.put(PaymentManager());
    return Scaffold(
      
      body: Column(
        children: [
           appbar(  

          function: () {
            Get.back();
          },
          title: "payment details".tr ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SafeArea(
                child: SizedBox(
                    child: Column(
                  children: [
                    const Spacer(),
                    Center(
                      child: Image.asset("assets/images/payment-providers.png"),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    OrderInfoItem(
                        infoName: "Order Subtotal".tr,
                        value: paymentManager.originalPrice(),
                        textStyle: AppStyleText.textStyle_18),
                    OrderInfoItem(
                        infoName: "Discount".tr,
                        value: paymentManager.totoalDisount().roundToDouble(),
                        textStyle: AppStyleText.textStyle_18),
                    Divider(
                      endIndent: 30,
                      indent: 30,
                      thickness: 1.4,
                      color: ColorApp.graey,
                    ),
                    OrderInfoItem(
                      infoName: "Total Price".tr,
                      value: paymentManager.calcTotalPrice().roundToDouble(),
                      textStyle: AppStyleText.textStyle_25,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                        child: GetBuilder<PaymentManager>(
                      builder: (controller) => CoustemBtnWitheLoading(
                        backgroundColor: Colors.green,
                        isLoading: controller.isLoading,
                        function: () async {
                          return await controller.makePayment(
                              PaymentManager().calcTotalPrice().toInt() * 10, 'USD');
                        },
                        content: 'pay'.tr,
                      ),
                    )),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
