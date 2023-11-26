import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zosr/futures/home/data/dataSource/remoteDataSource.dart';
import 'package:zosr/futures/search/presentation/manger/searchControllar.dart';
import 'package:zosr/futures/search/presentation/widget/loading_body_widget.dart';
import 'package:zosr/futures/search/presentation/widget/prodects_list_widget.dart';
import 'package:zosr/futures/search/presentation/widget/search_app_bar_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  static late SearchControllar controllar;
  @override
  Widget build(BuildContext context) {
    controllar = Get.put(SearchControllar());

    return Scaffold(
      appBar: searchAppBar(context),
      body: SafeArea(
          child: FutureBuilder(
        future: RemoteDataSourcHomeImpl().getAllProdect('products'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SearchProdectlist(prodects: snapshot);
          }
          return const LoadingSearchBody();
        },
      )),
    );
  }
}
