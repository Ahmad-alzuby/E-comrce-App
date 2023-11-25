import 'package:flutter/material.dart';
import 'package:zosr/core/constant/colors.dart';
import 'package:zosr/futures/home/data/models/prodect.dart';

// ignore: must_be_immutable
class ProdectRating extends StatelessWidget {
  ProdectRating({
    super.key,
    required this.prodect,
  });
  ProdectModel prodect;

  @override
  Widget build(BuildContext context) {
    return calcRating(prodect.rating!.toDouble());
  }
}

Widget calcRating(double rating) {
  switch (rating.round()) {
    case 1:
      return Row(
        children: [
          const Icon(Icons.star),
          Icon(Icons.star, color: ColorApp.cardColor),
          Icon(Icons.star, color: ColorApp.cardColor),
          Icon(Icons.star, color: ColorApp.cardColor),
          Icon(Icons.star, color: ColorApp.cardColor),
          Icon(Icons.star, color: ColorApp.cardColor)
        ],
      );
    case 2:
      return Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          const Icon(Icons.star, color: Colors.amber),
          Icon(Icons.star, color: ColorApp.cardColor),
          Icon(Icons.star, color: ColorApp.cardColor),
          Icon(Icons.star, color: ColorApp.cardColor)
        ],
      );
    case 3:
      return Row(children: [
        const Icon(Icons.star, color: Colors.amber),
        const Icon(Icons.star, color: Colors.amber),
        const Icon(Icons.star, color: Colors.amber),
        Icon(Icons.star, color: ColorApp.cardColor),
        Icon(Icons.star, color: ColorApp.cardColor)
      ]);
    case 4:
      return Row(
        children: [
          const Icon(Icons.star, color: Colors.amber),
          const Icon(Icons.star, color: Colors.amber),
          const Icon(Icons.star, color: Colors.amber),
          const Icon(Icons.star, color: Colors.amber),
          Icon(Icons.star, color: ColorApp.cardColor)
        ],
      );
    case 5:
      return Row(
        children: [
          const Icon(Icons.star, color: Colors.amber),
          const Icon(Icons.star, color: Colors.amber),
          const Icon(Icons.star, color: Colors.amber),
          const Icon(Icons.star, color: Colors.amber),
          Icon(Icons.star, color: ColorApp.cardColor)
        ],
      );

    default:
      return const Row(
        children: [
          Icon(Icons.star, color: Colors.amber),
          Icon(Icons.star, color: Colors.amber),
          Icon(Icons.star, color: Colors.amber),
          Icon(Icons.star, color: Colors.amber),
          Icon(Icons.star, color: Colors.amber)
        ],
      );
  }
}
