import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:zosr/core/constant/colors.dart';
import 'package:zosr/futures/home/data/dataSource/remoteDataSource.dart';
import 'package:zosr/futures/home/presentation/manger/searchControllar.dart';
import 'package:zosr/futures/home/presentation/screen/details_Screen.dart';
import 'package:zosr/futures/home/presentation/widget/Search_delget.dart';
import 'package:zosr/futures/home/presentation/widget/skelton_widget.dart';

import 'package:shimmer/shimmer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  static late SearchControllar controllar;
  @override
  Widget build(BuildContext context) {
    controllar = Get.put(SearchControllar());

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: serch_delget(),
                );
              },
              icon: Icon(
                Icons.search,
                color: ColorApp.graey,
              ))),
      body: SafeArea(
          child: FutureBuilder(
        future: RemoteDataSourcHomeImpl().getAllProdect('products'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Expanded(
                child: ListView.builder(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width / 30),
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  delay: const Duration(milliseconds: 100),
                  child: SlideAnimation(
                    duration: const Duration(milliseconds: 2500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    verticalOffset: -250,
                    child: ScaleAnimation(
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(DetaliesView(
                              prodect: snapshot.data![index], index: index));
                        },
                        child: ListTile(
                          trailing: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                                "${snapshot.data![index].thumbnail}",
                                width: 100),
                          ),
                          subtitle: Text("${snapshot.data![index].description}",
                              maxLines: 1, overflow: TextOverflow.ellipsis),
                          title: Text("${snapshot.data![index].title}"),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ));
          }
          return Center(
              child: ListView.builder(
                  itemBuilder: (context, index) => Shimmer.fromColors(
                        baseColor: Colors.black,
                        highlightColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        child: ListTile(
                            title: SkeltonWidget(higet: 10, width: 30),
                            subtitle: SkeltonWidget(higet: 10, width: 50),
                            trailing: SkeltonWidget(higet: 100, width: 100)),
                      )));
        },
      )),
    );
  }
}
