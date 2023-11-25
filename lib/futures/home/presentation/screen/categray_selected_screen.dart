import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'package:zosr/core/constant/apiRoute.dart';

import 'package:zosr/core/localizaton/localization_controllaer.dart';
import 'package:zosr/futures/home/data/dataSource/remoteDataSource.dart';
import 'package:zosr/futures/home/presentation/manger/categrayControllar.dart';

import 'package:zosr/futures/home/presentation/screen/details_Screen.dart';
import 'package:zosr/futures/home/presentation/widget/categray_list.dart';
import 'package:zosr/futures/home/presentation/widget/item_widget.dart';
import 'package:zosr/futures/home/presentation/widget/loading_homeBody.dart';

import '../../../../core/constant/colors.dart';

// ignore: must_be_immutable
class CatergaySelectedScreen extends StatelessWidget {
  String cayegrayNameSelected;
  CatergaySelectedScreen({super.key, required this.cayegrayNameSelected});

  @override
  Widget build(BuildContext context) {
    CategrayConttrollar conttrollar = Get.find();

    LocaleController localeController = Get.find();
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: RemoteDataSourcHomeImpl().getAllProdect(
                // ignore: prefer_interpolation_to_compose_strings
                ApiEndBoint.baseUrl + '/' "${conttrollar.catName}"),
            builder: (context, snapshotCatgray) {
              if (snapshotCatgray.hasData) {
                return SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: FutureBuilder(
                            future: RemoteDataSourcHomeImpl()
                                .getAllProdect(ApiEndBoint.all),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final seen = <String>{};
                                final uniqueList = snapshot.data!
                                    .where((str) => seen.add(str.category!))
                                    .toList();

                                return CategrayList(
                                    uniqueList: uniqueList,
                                    conttrollar: conttrollar,
                                    localeController: localeController,
                                    snapshotCatgray: snapshotCatgray);
                              }

                              return const Center();
                            }),
                      ),
                      Expanded(
                          child: AnimationLimiter(
                              child: GridView.count(
                                  physics: const BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
                                  padding: EdgeInsets.all(w / 60),
                                  crossAxisCount: 2,
                                  children: List.generate(
                                      snapshotCatgray.data!.length,
                                      (int index) {
                                    return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      columnCount: 2,
                                      child: ScaleAnimation(
                                        duration:
                                            const Duration(milliseconds: 900),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        child: FadeInAnimation(
                                            child: GestureDetector(
                                          onTap: () async {
                                            return await Get.to(DetaliesView(
                                                prodect: snapshotCatgray
                                                    .data![index],
                                                index: index));
                                          },
                                          child: ProdectWidget(
                                              index: index,
                                              prodects:
                                                  snapshotCatgray.data![index],
                                              backgroundColor: ColorApp.white),
                                        )),
                                      ),
                                    );
                                  })))),
                    ],
                  ),
                );
              } else if (snapshotCatgray.connectionState ==
                  ConnectionState.waiting) {
                // ignore: prefer_const_constructors
                return LoadingHomeBodyWidget();
              }
              return const Center();
            }),
      ),
    );
  }
}
