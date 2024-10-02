import 'package:e_commerce_cleac_arch/core/utils/service_locator.dart';
import 'package:e_commerce_cleac_arch/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:e_commerce_cleac_arch/features/home/domain/use_cases/get_products_use_case.dart';
import 'package:e_commerce_cleac_arch/features/home/presentation/manger/categories_bloc/categories_bloc.dart';
import 'package:e_commerce_cleac_arch/features/home/presentation/manger/products_bloc/products_bloc.dart';
import 'package:e_commerce_cleac_arch/features/home/presentation/views/widgtes/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsBloc>(
          create: (BuildContext context) {
            return ProductsBloc(
              locator.get<GetProductsUseCase>(),
            )..add(GetProductEvents());
          },
        ),
        BlocProvider(create: (BuildContext context) {
          return CategoriesBloc(locator.get<GetCategoriesUseCase>())
            ..add(GetCategoriesEvent());
        })
      ],
      child: const Scaffold(body: HomeViewBody()),
    );
  }
}
