class ProductEntity {
  final int productId, productCount;
  final String productTitle, productDescription, productCategory, productImage;
  final num productPrice, productRating;

  ProductEntity(
      {required this.productId,
      required this.productTitle,
      required this.productDescription,
      required this.productCategory,
      required this.productImage,
      required this.productPrice,
      required this.productRating,
      required this.productCount});
}
