// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:zosr/core/constant/const.dart';
import 'package:zosr/core/constant/imageAssets.dart';
import 'package:zosr/futures/auth/view/widget/custom_btn.dart';
import 'package:zosr/futures/home/data/models/prodect.dart';
import 'package:zosr/futures/home/presentation/manger/favoriteControlaer.dart';
import 'package:zosr/futures/home/presentation/screen/details_Screen.dart';
import 'package:zosr/futures/home/presentation/widget/item_widget.dart';
import 'package:zosr/futures/payment/presentation/screen/my_card_screen.dart';

// ignore: must_be_immutable
class FavoriteScreen extends StatefulWidget {
  int? index;
  FavoriteScreen({super.key, @required this.index});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

// Hive.box<ProdectModel>(kBoxName).length,
class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    FavoriteControllar controllar = Get.put(FavoriteControllar());
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(children: [
        Expanded(
            child: Hive.box<ProdectModel>(kfavoriteBox).length > 0
                ? GetBuilder<FavoriteControllar>(
                    builder: (controller) => GridView.builder(
                        physics: const BouncingScrollPhysics(
                                            parent:
                                                AlwaysScrollableScrollPhysics()),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 3 / 3.7),
                        itemCount: Hive.box<ProdectModel>(kfavoriteBox).length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () async {
                                return await Get.to(DetaliesView(
                                    prodect: Hive.box<ProdectModel>(kfavoriteBox)
                                        .getAt(index)!,
                                    index: index));
                              },
                              child: Column(
                                children: [
                                  Stack(children: [
                                    ProdectWidget(
                                        index: index,
                                        prodects:
                                            Hive.box<ProdectModel>(kfavoriteBox)
                                                .getAt(index)!,
                                        backgroundColor: const Color.fromARGB(
                                            255, 121, 121, 121)),
                                    IconButton(
                                      onPressed: () {
                                        controllar.deletProdct(
                                            Hive.box<ProdectModel>(kfavoriteBox)
                                                .getAt(index)!,
                                            index);
                                      },
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: Color.fromARGB(255, 174, 51, 43),
                                      ),
                                    )
                                  ]),
                                  GetBuilder<FavoriteControllar>(

                                    builder: (controller) =>  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                            onPressed: () async{
                                        await      controller.addMoreIntForProdect(Hive.box<ProdectModel>(kfavoriteBox).getAt(index)!);
                                            },
                                            icon: const Icon(
                                              FontAwesomeIcons.plus,
                                              size: 16,
                                            )),
                                        GetBuilder<FavoriteControllar>(
                                            builder: (controller) => Text(
                                                "${Hive.box(kNumOfprodect).get(Hive.box<ProdectModel>(kfavoriteBox).getAt(index)?.id )?? 0}")),
                                        IconButton(
                                            onPressed: () async{
                                                 await      controller.MinceOneForProdect(Hive.box<ProdectModel>(kfavoriteBox).getAt(index)!);
                                            },
                                            icon: const Icon(
                                              FontAwesomeIcons.minus,
                                              size: 16,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        }),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                          child: Lottie.asset(ImageAssets.knoFavorite,
                              fit: BoxFit.fill, height: 200))
                    ],
                  )),
        Hive.box<ProdectModel>(kfavoriteBox).length > 0
            ? CoustemBtnWidget(
                function: () {
                  Get.to(const my_cart_screen());
                },
                backgroundColor: Colors.green,
                text: 'pay'.tr)
            : const SizedBox()
      ]),
    ));
  }
}
