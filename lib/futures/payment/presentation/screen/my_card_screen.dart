// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:zosr/core/constant/colors.dart';
import 'package:zosr/core/constant/const.dart';

import 'package:zosr/core/shared/text_style.dart';

import 'package:zosr/futures/auth/view/widget/custom_BTN_withe_loading.dart';
import 'package:zosr/futures/home/data/models/prodect.dart';

import 'package:zosr/futures/payment/presentation/manger/payment_manger.dart';

import 'package:zosr/futures/payment/presentation/widget/orderInfo_widget.dart';

// ignore: must_be_immutable
class my_cart_screen extends StatelessWidget {
  List<ProdectModel> prodectModel;
  my_cart_screen({
    Key? key,
    required this.prodectModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaymentManager paymentManager = Get.put(PaymentManager());
    return Scaffold(
      body: ListView(
        children: [
          AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back)),
              title: Text("payment details".tr)),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SafeArea(
                  child: SizedBox(
                      child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    children: [
                      Center(
                        child:
                            Image.asset("assets/images/payment-providers.png"),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(color: Color.fromARGB(21, 0, 0, 0))
                            ]),
                        height: 150,
                        width: double.infinity,
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(
                              parent: BouncingScrollPhysics()),
                          itemCount: prodectModel.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromARGB(21, 0, 0, 0))
                                  ]),
                              child: OrderInfoItem(
                                  textStyle: AppStyleText.textStyle_18,
                                  infoName:
                                      prodectModel[index].title.toString(),
                                  value: Hive.box(kNumOfprodect)
                                          .get(prodectModel[index].id) ??
                                      1),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      OrderInfoItem(
                          infoName: "Order Subtotal".tr,
                          value: paymentManager.originalPrice(
                              Prodects: prodectModel),
                          textStyle: AppStyleText.textStyle_18),
                      OrderInfoItem(
                          infoName: "Discount".tr,
                          value: paymentManager
                              .totoalDisount(Prodects: prodectModel)
                              .roundToDouble(),
                          textStyle: AppStyleText.textStyle_18),
                      Divider(
                        endIndent: 30,
                        indent: 30,
                        thickness: 1.4,
                        color: ColorApp.graey,
                      ),
                      OrderInfoItem(
                        infoName: "Total Price".tr,
                        value: paymentManager
                            .calcTotalPrice(Prodects: prodectModel)
                            .roundToDouble(),
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
                                PaymentManager()
                                        .calcTotalPrice(Prodects: prodectModel)
                                        .toInt() *
                                    10,
                                'USD');
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
          ),
        ],
      ),
    );
  }
}
