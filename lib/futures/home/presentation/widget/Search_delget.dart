// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zosr/futures/home/data/models/prodect.dart';
import 'package:zosr/futures/home/presentation/screen/details_Screen.dart';
import 'package:zosr/futures/home/presentation/screen/search_screen.dart';
import 'package:zosr/futures/home/presentation/widget/item_widget.dart';

class serch_delget extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.backspace_rounded));
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.backspace_rounded));
  }

  @override
  Widget buildResults(
    BuildContext context,
  ) {
    List<ProdectModel> matchQuery = [];

    for (var prodect in SearchScreen.controllar.prodects) {
      if (prodect.title!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(prodect);
      }
    }
    return Expanded(
        child: ListView.builder(
            itemCount: matchQuery.length,
            itemBuilder: (context, index) => ProdectWidget(
                index: index,
                prodects: matchQuery[index],
                backgroundColor: Colors.black)));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    List<ProdectModel> matchQuery = [];

    for (var prodect in SearchScreen.controllar.prodects) {
      if (prodect.title!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(prodect);
      }
    }
    return Expanded(
        child: ListView.builder(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 30),
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: matchQuery.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(bottom: w / 20),
          height: w / 4,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 40,
                spreadRadius: 10,
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              Get.to(DetaliesView(prodect: matchQuery[index], index: index));
            },
            child: ListTile(
              trailing: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child:
                    Image.network("${matchQuery[index].thumbnail}", width: 100),
              ),
              subtitle: Text("${matchQuery[index].description}",
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              title: Text("${matchQuery[index].title}"),
            ),
          ),
        );
      },
    ));
  }
}
