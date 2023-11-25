import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:zosr/core/constant/const.dart';
import 'package:zosr/core/shared/text_style.dart';
import 'package:zosr/futures/home/data/models/prodect.dart';
import 'package:zosr/futures/home/presentation/manger/favoriteControlaer.dart';
import 'package:zosr/futures/home/presentation/widget/rating_widget.dart';

// ignore: must_be_immutable
class DetailesProdect extends StatelessWidget {
  DetailesProdect({
    required this.prodect,
    super.key,
  });
  ProdectModel prodect;
  FavoriteControllar favorite = Get.put(FavoriteControllar());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Stack(children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Hero(
                  tag: "${prodect.id}",
                  child: Image(
                    fit: BoxFit.fill,
                    image: CachedNetworkImageProvider(
                      '${prodect.thumbnail}',
                    ),
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                ),
              ),
            ),
            GetBuilder<FavoriteControllar>(
               builder :(controller) =>  Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: IconButton(
                    onPressed: () async {
                      controller.addProdect(prodect);
                    },
                    icon: Icon(
                   Hive.box<ProdectModel>(kfavoriteBox).containsKey(prodect.id)?     Icons.favorite : Icons.favorite_border,
                  
                      color:    Hive.box<ProdectModel>(kfavoriteBox).containsKey(prodect.id)?  Colors.red :Colors.blue,
                      size: 40,
                    ),
                  )),
            )
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        "${prodect.price! - prodect.discountPercentage!.round()}",
                        style: AppStyleText.textStyle_22,
                      ),
                      Text(
                        r"$",
                        style: AppStyleText.textStyle_22,
                      ),
                      Text("${prodect.price}",
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      Text(
                        r"$",
                        style: AppStyleText.textStyle_16,
                      ),
                    ],
                  )),
              Expanded(
                child: Text(
                textAlign: TextAlign.end,
                  "${prodect.title}",
                  style: AppStyleText.textStyle_22,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${prodect.description}',
            maxLines: 6,
            style: AppStyleText.textStyle_16,
          ),
          const SizedBox(
            height: 10,
          ),

     Row(children: [ProdectRating(prodect: prodect,    ), Text("(${prodect.rating})")],)
 
        ],
      ),
    );
  }
}
