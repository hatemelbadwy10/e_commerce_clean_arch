import 'dart:developer';
import 'package:e_commerce_cleac_arch/core/utils/styles.dart';
import 'package:e_commerce_cleac_arch/features/home/presentation/manger/products_bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    required this.index,
    required this.isChosen,
    required this.onCategorySelected,
  });

  final String category;
  final int index;
  final bool isChosen;
  final Function(int?) onCategorySelected; // Accept null to deselect

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isChosen) {
          log('Deselected category: $category');
          context.read<ProductsBloc>().add(GetProductEvents());
          onCategorySelected(null);
        } else {
          log('Selected category: $category');
          context.read<ProductsBloc>().add(GetProductEvents(category: category));
          onCategorySelected(index);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Container(
          width: 100,
          decoration: BoxDecoration(
            color: isChosen ? Colors.black : Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              category,
              style: Styles.textStyle10.copyWith(
                color: isChosen ? Colors.white : Colors.black, // Update text color based on chosen state
              ),
            ),
          ),
        ),
      ),
    );
  }
}
