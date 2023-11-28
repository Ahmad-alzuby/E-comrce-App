// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:zosr/core/constant/const.dart';
import 'package:zosr/futures/auth/view/widget/custom_btn.dart';
import 'package:zosr/futures/favorite/presentation/widget/favorite_grid_view.dart';
import 'package:zosr/futures/favorite/presentation/widget/no_favorite_widget.dart';
import 'package:zosr/futures/home/data/models/prodect.dart';
import 'package:zosr/futures/favorite/presentation/manger/favoriteControlaer.dart';
import 'package:zosr/futures/payment/presentation/screen/my_card_screen.dart';

// ignore: must_be_immutable
class FavoriteScreen extends StatefulWidget {
  int? index;
  FavoriteScreen({super.key, @required this.index});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  
  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllar());

    return GetBuilder<FavoriteControllar>(builder: (controller) => 
       Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          Expanded(
              child:         Hive.box<ProdectModel>(kfavoriteBox).length > 0
    
                  ?  
                            FavoriteGridView(controllar: controller,)
                    
                  : const SizedBox(
                    height: 50 ,
                    child: NoFavoriteWidget())),
          Hive.box<ProdectModel>(kfavoriteBox).length > 0
              ? CoustemBtnWidget(
                  function: () {
                    Get.to(my_cart_screen(
                        prodectModel: Hive.box<ProdectModel>(kfavoriteBox)
                            .values
                            .toList()));
                  },
                  backgroundColor: Colors.green,
                  text: 'pay'.tr)
              : const SizedBox()
        ]),
      )),
    );
  }
}

