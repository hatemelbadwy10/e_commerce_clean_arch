import 'package:e_commerce_cleac_arch/core/extentions/navigation_extention.dart';
import 'package:e_commerce_cleac_arch/core/utils/styles.dart';
import 'package:e_commerce_cleac_arch/features/home/domain/entites/product_entity.dart';
import 'package:e_commerce_cleac_arch/features/home/presentation/views/product_details_view.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(ProductDetailsView(
          productEntity: productEntity,
        ));
      },
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: 120,
              child: Hero(
                  tag: productEntity,
                  child: Image.network(productEntity.productImage)),
            ),
            Text(
              productEntity.productTitle,
              style: Styles.textStyle15,
              overflow: TextOverflow.ellipsis,
            ),
            Text(productEntity.productPrice.toString())
          ],
        ),
      ),
    );
  }
}
