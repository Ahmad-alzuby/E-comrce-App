import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'package:zosr/core/shared/text_style.dart';
import 'package:zosr/futures/home/data/models/prodect.dart';

// ignore: must_be_immutable
class ProdectWidget extends StatelessWidget {
  ProdectModel prodects;
  int index;
  Color backgroundColor;
  ProdectWidget({
    required this.index,
    required this.prodects,
    required this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 100,
                child: Hero(
                  tag: "${prodects.id}",
                  child: Image(
                    fit: BoxFit.fitHeight,
                    image: CachedNetworkImageProvider(
                      "${prodects.thumbnail}",
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      "${prodects.price}",
                      style: AppStyleText.textStyle_18,
                    ),
                    Text(
                      r"$",
                      style: AppStyleText.textStyle_18,
                    ),
                  ],
                ),
                SizedBox(
                  width: 100,
                  child: Text("${prodects.title}",
                      style: AppStyleText.textStyle_18,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
            Text(
              '${prodects.description}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
