class ProductModel {
  final int id;
  final String title, description, category, image;
  final double price;
  final Rating rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.image,
      required this.price,
      required this.rating});

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
      Rating(rating: json['rating'], count: json['count']);
}
