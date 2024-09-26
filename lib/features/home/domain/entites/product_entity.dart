class ProductEntity {
  final int id, count;
  final String title, description, category, image;
  final double price, rating;

  ProductEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.image,
      required this.price,
      required this.rating,
      required this.count});
}
