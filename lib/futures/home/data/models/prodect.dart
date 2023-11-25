import 'package:hive/hive.dart';
part 'prodect.g.dart';

@HiveType(typeId: 0)
class ProdectModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  int? price;
  @HiveField(4)
  double? discountPercentage;
  @HiveField(5)
  double? rating;
  @HiveField(6)
  int? stock;
  @HiveField(7)
  String? brand;
  @HiveField(8)
  String? category;
  @HiveField(9)
  String? thumbnail;
  @HiveField(10)
  List<dynamic>? images;

  ProdectModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  factory ProdectModel.fromJson(Map<String, dynamic> json) => ProdectModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        price: json['price'] as int?,
        discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
        rating: (json['rating'] as num?)?.toDouble(),
        stock: json['stock'] as int?,
        brand: json['brand'] as String?,
        category: json['category'] as String?,
        thumbnail: json['thumbnail'] as String?,
        images: json['images'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'discountPercentage': discountPercentage,
        'rating': rating,
        'stock': stock,
        'brand': brand,
        'category': category,
        'thumbnail': thumbnail,
        'images': images,
      };
}
