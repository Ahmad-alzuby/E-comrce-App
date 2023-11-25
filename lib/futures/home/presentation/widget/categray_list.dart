import 'package:flutter/material.dart';
import 'package:zosr/core/constant/colors.dart';
import 'package:zosr/core/localizaton/localization_controllaer.dart';
import 'package:zosr/core/shared/text_style.dart';
import 'package:zosr/futures/home/data/models/prodect.dart';
import 'package:zosr/futures/home/presentation/manger/categrayControllar.dart';

class CategrayList extends StatelessWidget {
  const CategrayList(
      {super.key,
      required this.uniqueList,
      required this.conttrollar,
      required this.localeController,
      required this.snapshotCatgray});
  final AsyncSnapshot<List<ProdectModel>> snapshotCatgray;
  final List<ProdectModel> uniqueList;
  final CategrayConttrollar conttrollar;
  final LocaleController localeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ListView.builder(
            itemCount: uniqueList.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  conttrollar.cangeName("${uniqueList[index].category}");
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: localeController.brightness.value ==
                              Brightness.dark
                          ? BoxDecoration(
                              color: uniqueList[index].category ==
                                      snapshotCatgray.data![0].category
                                  ? const Color.fromARGB(250, 51, 49, 49)
                                  : const Color.fromARGB(252, 82, 81, 81),
                              borderRadius: BorderRadius.circular(16))
                          : BoxDecoration(
                              color: uniqueList[index].category ==
                                      snapshotCatgray.data![0].category
                                  ? const Color.fromARGB(255, 185, 185, 185)
                                  : const Color.fromARGB(255, 197, 197, 197),
                              borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                              snapshotCatgray.connectionState ==
                                          ConnectionState.waiting &&
                                      snapshotCatgray.data![0].category ==
                                          uniqueList[index].category
                                  ? "Loading.."
                                  : "${uniqueList[index].category}",
                              style: uniqueList[index].category ==
                                      snapshotCatgray.data![3].category
                                  ? AppStyleText.textStyle_18
                                      .copyWith(color: ColorApp.white)
                                  : AppStyleText.textStyle_18.copyWith(
                                      color: const Color.fromARGB(
                                          255, 56, 54, 54))),
                        ),
                      )),
                ))));
  }
}
