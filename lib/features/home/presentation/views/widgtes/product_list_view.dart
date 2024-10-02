import 'package:e_commerce_cleac_arch/features/home/presentation/views/widgtes/product_item.dart';
import 'package:e_commerce_cleac_arch/features/home/presentation/views/widgtes/products_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manger/products_bloc/products_bloc.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const ProductsShimmerWidget();
        } else if (state is ProductSuccess) {
          return Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20
              ),
              itemCount: state.product.length,
              itemBuilder: (context, index) {
                return ProductItem(productEntity: state.product[index]);
              },

            ),
          );
        } else if (state is ProductFailure) {
          return Text(state.err);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
