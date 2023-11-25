import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zosr/core/constant/apiRoute.dart';

import 'package:zosr/futures/home/data/dataSource/remoteDataSource.dart';
import 'package:zosr/futures/home/presentation/manger/categrayControllar.dart';
import 'package:zosr/futures/home/presentation/manger/homeControolar.dart';
import 'package:zosr/futures/home/presentation/screen/categray_selected_screen.dart';
import 'package:zosr/futures/home/presentation/widget/catgrayItem.dart';

import 'package:zosr/futures/home/presentation/widget/skelton_widget.dart';
import 'package:shimmer/shimmer.dart';

class CategrayScreen extends StatelessWidget {
  const CategrayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControolar homeControolar = HomeControolar(CategrayName: '');
    Get.put(CategrayConttrollar());
    return Scaffold(
      body: GetBuilder<CategrayConttrollar>(
        builder: (controller) => controller.isInCatgray.value == false
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  child: FutureBuilder(
                      future: RemoteDataSourcHomeImpl()
                          .getAllProdect(ApiEndBoint.all),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final seen = <String>{};
                          final uniqueList = snapshot.data!
                              .where((str) => seen.add(str.category!))
                              .toList();

                          return Expanded(
                            child: GridView.builder(
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 16,
                                        crossAxisSpacing: 16,
                                        crossAxisCount: 2),
                                itemCount: uniqueList.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      try {
                                        await controller.cangeName(
                                            "${uniqueList[index].category}");
                                        homeControolar.CategrayName =
                                            uniqueList[index].category!;
                                        controller.updateCategrayName();
                                      } catch (e) {
                                        return;
                                      }
                                    },
                                    child: CatgrayItem(
                                      onTap: () {},
                                      title: "${uniqueList[index].category}",
                                    ),
                                  );
                                }),
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return (Expanded(
                              child: GridView.builder(
                            itemCount: 6,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) => Shimmer.fromColors(
                              baseColor: Colors.black,
                              highlightColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              child: SizedBox(
                                  height: 200,
                                  width: 200,
                                  child: Column(
                                    children: [
                                      SkeltonWidget(higet: 170, width: 170),
                                    ],
                                  )),
                            ),
                          )));
                        }
                        return const Center();
                      }),
                ),
              )
            : CatergaySelectedScreen(
                cayegrayNameSelected:
                    "products/category/${controller.catName}"),
      ),
    );
  }
}
