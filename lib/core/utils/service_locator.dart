import 'package:e_commerce_cleac_arch/features/home/data/data_source/remote_data_source.dart';
import 'package:e_commerce_cleac_arch/features/home/data/home_repo_impl/home_repo_impl.dart';
import 'package:e_commerce_cleac_arch/features/home/domain/home_repo/home_repo.dart';
import 'package:e_commerce_cleac_arch/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:e_commerce_cleac_arch/features/home/domain/use_cases/get_products_use_case.dart';
import 'package:e_commerce_cleac_arch/features/home/presentation/manger/categories_bloc/categories_bloc.dart';
import 'package:e_commerce_cleac_arch/features/home/presentation/manger/products_bloc/products_bloc.dart';
import 'package:get_it/get_it.dart';
import 'dio_helper.dart';

GetIt locator = GetIt.instance;

Future setup() async {
  locator.registerSingleton(DioHelper());
  locator.registerSingleton<HomeRemoteDataSource>(
      HomeRemoteDataSourceImpl(dioHelper: locator.get<DioHelper>()));
  locator.registerSingleton<HomeRepo>(
      HomeRepoImpl(homeRemoteDataSource: locator.get<HomeRemoteDataSource>()));
  locator
      .registerSingleton(GetProductsUseCase(homeRepo: locator.get<HomeRepo>()));
  locator.registerSingleton(
      GetCategoriesUseCase(homeRepo: locator.get<HomeRepo>()));
  locator.registerSingleton(ProductsBloc(
      locator.get<GetProductsUseCase>(),));
  locator.registerSingleton(CategoriesBloc(locator.get<GetCategoriesUseCase>()));
}
