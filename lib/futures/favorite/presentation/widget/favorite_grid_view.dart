
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:zosr/core/constant/const.dart';
import 'package:zosr/futures/favorite/presentation/manger/favoriteControlaer.dart';
import 'package:zosr/futures/favorite/presentation/widget/favorite_prodect_widget.dart';
import 'package:zosr/futures/home/data/models/prodect.dart';

// ignore: must_be_immutable
class FavoriteGridView extends StatelessWidget {
  FavoriteControllar controllar;
    FavoriteGridView({
    required this.controllar,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 3 / 3.7),
        itemCount: Hive.box<ProdectModel>(kfavoriteBox).length,
        itemBuilder: (context, index) {
          
          // return const Text('data');
        
          return FavoriteItemWidget(
            controllar: controllar,
            index: index,
          );
        });
  }
}
