
  import 'package:flutter/material.dart';
import 'package:zosr/core/constant/colors.dart';
 
import 'package:zosr/futures/search/presentation/widget/Search_delget.dart';

AppBar searchAppBar(BuildContext context){
  return AppBar( backgroundColor: Colors.transparent,
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
            )));
}