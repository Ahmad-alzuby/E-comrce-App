
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:zosr/core/constant/imageAssets.dart';

class NoFavoriteWidget extends StatelessWidget {
  const NoFavoriteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
              child: Lottie.asset(ImageAssets.knoFavorite,
                  fit: BoxFit.fill, height: 200))
        ],
      );
  }
}