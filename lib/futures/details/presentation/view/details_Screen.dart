// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:zosr/core/constant/apiRoute.dart';
import 'package:zosr/core/constant/colors.dart';
import 'package:zosr/core/shared/text_style.dart';
import 'package:zosr/futures/home/data/dataSource/remoteDataSource.dart';
import 'package:zosr/futures/home/data/models/prodect.dart';
import 'package:zosr/futures/favorite/presentation/manger/favoriteControlaer.dart';
import 'package:zosr/futures/home/presentation/manger/homeControolar.dart';
import 'package:zosr/futures/details/presentation/widgets/detailes_widget.dart';
import 'package:zosr/futures/home/presentation/widget/item_widget.dart';
import 'package:zosr/futures/payment/presentation/screen/my_card_screen.dart';
import 'package:zosr/futures/splash/view/widget/coustem_button_widget.dart';

// ignore: must_be_immutable
class DetaliesView extends StatefulWidget {
  ProdectModel? prodect;
  int? index;
  DetaliesView({super.key, @required this.prodect, @required this.index});

  @override
  State<DetaliesView> createState() => _DetaliesViewState();
}

class _DetaliesViewState extends State<DetaliesView> {
  FavoriteControllar favorite = Get.put(FavoriteControllar());

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
             physics: const BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
                  children: [
                  DetailesProdect(
                    prodect: widget.prodect!,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Related Prodect:',
                      style: AppStyleText.textStyle_22,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 200,
                    child: FutureBuilder(
                      future: RemoteDataSourcHomeImpl().getAllProdect(
                          HomeControolar(
                                  CategrayName:
                                      "${ApiEndBoint.baseUrl}/${widget.prodect!.category!}")
                              .CategrayName),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return AnimationLimiter(
                              child: GridView.count(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width / 60),
                                  crossAxisCount: 1,
                                  children: List.generate(snapshot.data!.length,
                                      (int index) {
                                    return AnimationConfiguration.staggeredGrid(
                                        position: index,
                                        duration: const Duration(milliseconds: 500),
                                        columnCount: 2,
                                        child: ScaleAnimation(
                                            duration:
                                                const Duration(milliseconds: 900),
                                            curve:
                                                Curves.fastLinearToSlowEaseIn,
                                            child: FadeInAnimation(
                                              child: GestureDetector(
                                                onTap: () =>
                                                    Navigator.of(context)
                                                        .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetaliesView(
                                                          prodect: snapshot
                                                              .data![index],
                                                          index: index),
                                                )),
                                                child: ProdectWidget(
                                                    index: index,
                                                    prodects:
                                                        snapshot.data![index],
                                                    backgroundColor:
                                                        ColorApp.graey),
                                              ),
                                            )));
                                  })));
                        }

                        return const SizedBox();
                      },
                    ),
                  ),
                  // ignore: missing_required_param
                  GetBuilder<FavoriteControllar>(
                    builder: (controller) => 
                  // ignore: missing_required_param
                  CoustemButtonWidget(
                  
                         text:      'pay'.tr,
                      function: () {
               Get.to(  my_cart_screen(prodectModel: [widget.prodect!],));
                       
                     
                      },
                    ),
                  )
                ]))));
  }
}
