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
  FavoriteControllar controllar;
  int index;
  FavoriteItemWidget({
    required this.controllar,
    required this.index,
    super.key,
  });


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
              GetBuilder<FavoriteControllar>(
                builder: (controller) => 
                 IconButton(
                  onPressed: () {
                    controller.deletProdct(
                        Hive.box<ProdectModel>(kfavoriteBox).getAt(index)!,
                        index);
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Color.fromARGB(255, 174, 51, 43),
                  ),
                ),
              )
            ]),
         Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () async {
                        await controllar.addMoreIntForProdect(
                            Hive.box<ProdectModel>(kfavoriteBox).getAt(index)!);
                      },
                      icon: const Icon(
                        FontAwesomeIcons.plus,
                        size: 16,
                      )),
                  Text(
                      "${Hive.box(kNumOfprodect).get(Hive.box<ProdectModel>(kfavoriteBox).getAt(index)!.id)}"),
                  IconButton(
                      onPressed: () async {
                        await controllar.MinceOneForProdect(
                            Hive.box<ProdectModel>(kfavoriteBox).getAt(index)!);
                      },
                      icon: const Icon(
                        FontAwesomeIcons.minus,
                        size: 16,
                      )),
                ],
              
            ),
          ],
        ));
  }
}
