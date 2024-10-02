import 'package:e_commerce_cleac_arch/features/home/domain/entites/product_entity.dart';

class ProductModel extends ProductEntity {
  final int id;
  final String title, description, category, image;
  final num price;
  final Rating rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.image,
      required this.price,
      required this.rating})
      : super(
            productId: id,
            productTitle: title,
            productDescription: description,
            productCategory: category,
            productImage: image,
            productPrice: price,
            productRating: rating.rating,
            productCount: rating.count);

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      price: json['price'],
      rating: Rating.fromJson(json['rating']));
}

class Rating {
  final double rating;
  final int count;

  Rating({required this.rating, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) =>
      Rating(rating: json['rating']??0.0, count: json['count']);
}
