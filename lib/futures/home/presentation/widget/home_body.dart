// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'package:zosr/futures/home/presentation/widget/loading_homeBody.dart';

import 'package:zosr/core/constant/colors.dart';

import 'package:zosr/futures/home/data/dataSource/remoteDataSource.dart';
import 'package:zosr/futures/home/presentation/manger/homeControolar.dart';
import 'package:zosr/futures/home/presentation/screen/details_Screen.dart';
import 'package:zosr/futures/home/presentation/widget/appBar.dart';

import 'package:zosr/futures/home/presentation/widget/item_widget.dart';
import 'package:zosr/servers/serviers.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    MYServices myServices = Get.find();
    HomeControolar homeControolar = Get.find();

    return Scaffold(
      extendBody: false,
      body: SafeArea(
        child: Column(children: [
          AppBarCoustem(myServices: myServices, homeControolar: homeControolar),
          FutureBuilder(
              future: RemoteDataSourcHomeImpl()
                  .getAllProdect(homeControolar.CategrayName),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                      child: AnimationLimiter(
                          child: GridView.count(
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              padding: EdgeInsets.all(w / 60),
                              crossAxisCount: 2,
                              children: List.generate(snapshot.data!.length,
                                  (int index) {
                                return AnimationConfiguration.staggeredGrid(
                                  position: index,
                                  duration: const Duration(milliseconds: 500),
                                  columnCount: 2,
                                  child: ScaleAnimation(
                                    duration: const Duration(milliseconds: 900),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    child: FadeInAnimation(
                                        child: GestureDetector(
                                      onTap: () async {
                                        return await Get.to(DetaliesView(
                                            prodect: snapshot.data![index],
                                            index: index));
                                      },
                                      child: ProdectWidget(
                                          index: index,
                                          prodects: snapshot.data![index],
                                          backgroundColor: ColorApp.white),
                                    )),
                                  ),
                                );
                              }))));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const LoadingHomeBodyWidget();
                }
                return const Center();
              }),
        ]),
      ),
    );
  }
}
