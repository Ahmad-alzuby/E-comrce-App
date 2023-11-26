import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:zosr/core/constant/const.dart';
import 'package:zosr/futures/home/data/models/prodect.dart';
import 'package:zosr/futures/favorite/presentation/manger/favoriteControlaer.dart';
import 'package:zosr/futures/details/presentation/view/details_Screen.dart';
import 'package:zosr/futures/home/presentation/widget/item_widget.dart';

// ignore: must_be_immutable
class FavoriteItemWidget extends StatelessWidget {
  int index;
  FavoriteItemWidget({
    required this.index,
    super.key,
    required this.controllar,
  });

  final FavoriteControllar controllar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          return await Get.to(DetaliesView(
              prodect: Hive.box<ProdectModel>(kfavoriteBox).getAt(index)!,
              index: index));
        },
        child: Column(
          children: [
            Stack(children: [
              ProdectWidget(
                  index: index,
                  prodects: Hive.box<ProdectModel>(kfavoriteBox).getAt(index)!,
                  backgroundColor: const Color.fromARGB(255, 121, 121, 121)),
              IconButton(
                onPressed: () {
                  controllar.deletProdct(
                      Hive.box<ProdectModel>(kfavoriteBox).getAt(index)!,
                      index);
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 174, 51, 43),
                ),
              )
            ]),
            GetBuilder<FavoriteControllar>(
              builder: (controller) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () async {
                        await controller.addMoreIntForProdect(
                            Hive.box<ProdectModel>(kfavoriteBox).getAt(index)!);
                      },
                      icon: const Icon(
                        FontAwesomeIcons.plus,
                        size: 16,
                      )),
                  GetBuilder<FavoriteControllar>(
                      builder: (controller) => Text(
                          "${Hive.box(kNumOfprodect).get(Hive.box<ProdectModel>(kfavoriteBox).getAt(index)?.id) ?? 0}")),
                  IconButton(
                      onPressed: () async {
                        await controller.MinceOneForProdect(
                            Hive.box<ProdectModel>(kfavoriteBox).getAt(index)!);
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
  }
}
