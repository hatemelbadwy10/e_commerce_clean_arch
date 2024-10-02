import 'package:e_commerce_cleac_arch/features/home/presentation/views/widgtes/category_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manger/categories_bloc/categories_bloc.dart';
import 'category_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesFailure) {
          return Text(state.err);
        } else if (state is CategoryLoading) {
          return const Center(child: CategoryShimmerWidget());
        } else if (state is CategorySuccess) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.categories.length,
            itemBuilder: (BuildContext context, int index) {
              return CategoryItem(
                category: state.categories[index],
                index: index,
                isChosen: state.selectedIndex == index,
                onCategorySelected: (selectedIndex) {
                  context
                      .read<CategoriesBloc>()
                      .add(SelectCategoryEvent(selectedIndex));
                },
              );
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
