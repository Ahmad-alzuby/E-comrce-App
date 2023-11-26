import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:zosr/futures/home/data/models/prodect.dart';
import 'package:zosr/futures/details/presentation/view/details_Screen.dart';

// ignore: must_be_immutable
class SearchProdectlist extends StatelessWidget {
  AsyncSnapshot<List<ProdectModel>> prodects;
  SearchProdectlist({
    required this.prodects,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 30),
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: prodects.data!.length,
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
                      prodect: prodects.data![index], index: index));
                },
                child: ListTile(
                  trailing: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network("${prodects.data![index].thumbnail}",
                        width: 100),
                  ),
                  subtitle: Text("${prodects.data![index].description}",
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  title: Text("${prodects.data![index].title}"),
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}
