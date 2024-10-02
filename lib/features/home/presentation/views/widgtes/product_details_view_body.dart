import 'package:e_commerce_cleac_arch/core/utils/styles.dart';
import 'package:e_commerce_cleac_arch/features/home/domain/entites/product_entity.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
                tag: productEntity,
                child: Container(
                    height: 400,
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(12))),
                    child: Center(
                        child: Image.network(productEntity.productImage)))),
            const SizedBox(
              height: 15,
            ),
            Text(
              productEntity.productTitle,
              style: Styles.textStyle18,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Text(
                  'Price:',
                  style: Styles.textStyle11,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text('${productEntity.productPrice} \$')
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              productEntity.productDescription,
              style: Styles.textStyle11,
              maxLines: 6,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Text(
                  'count:',
                  style: Styles.textStyle11,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(productEntity.productCount.toString()),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Category:',
                  style: Styles.textStyle11,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text('${productEntity.productCategory} '),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Rating:',
                  style: Styles.textStyle11,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text('${productEntity.productRating} '),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Colors.black),
                  onPressed: () {},
                  child: Text(
                    'Add to Cart',
                    style: Styles.textStyle15.copyWith(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
