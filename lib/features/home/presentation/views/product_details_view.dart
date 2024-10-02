import 'package:e_commerce_cleac_arch/features/home/domain/entites/product_entity.dart';
import 'package:e_commerce_cleac_arch/features/home/presentation/views/widgtes/product_details_view_body.dart';
import 'package:flutter/material.dart';
class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productEntity});
final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body: ProductDetailsViewBody(productEntity: productEntity,)
    );
  }
}
