
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../home/presentation/widget/skelton_widget.dart';

class LoadingSearchBody extends StatelessWidget {
  const LoadingSearchBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}
