import 'package:e_commerce_cleac_arch/core/utils/styles.dart';
import 'package:e_commerce_cleac_arch/features/home/presentation/views/widgtes/category_list_view.dart';
import 'package:e_commerce_cleac_arch/features/home/presentation/views/widgtes/product_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Categories',
              style: Styles.textStyle18,
            ),
            SizedBox(height: 90, child: CategoryListView()),
            SizedBox(
              height: 24,
            ),
            Text(
              'Products',
              style: Styles.textStyle18,
            ),
            ProductListView()
          ],
        ),
      ),
    );
  }
}
