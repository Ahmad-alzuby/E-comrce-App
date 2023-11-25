// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:zosr/futures/home/presentation/widget/skelton_widget.dart';
import 'package:shimmer/shimmer.dart';

class LoadingHomeBodyWidget extends StatelessWidget {
  const LoadingHomeBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      itemCount: 20,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: const Color.fromARGB(255, 255, 255, 255),
        child: SizedBox(
            height: 200,
            width: 200,
            child: Column(
              children: [
                SkeltonWidget(higet: 100, width: 150),
                const SizedBox(
                  height: 10,
                ),
                SkeltonWidget(higet: 20, width: 120),
                const SizedBox(
                  height: 10,
                ),
                SkeltonWidget(higet: 20, width: 170),
              ],
            )),
      ),
    ));
  }
}
