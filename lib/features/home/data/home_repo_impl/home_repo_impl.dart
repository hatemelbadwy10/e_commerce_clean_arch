import 'package:e_commerce_cleac_arch/features/home/data/data_source/remote_data_source.dart';
import 'package:e_commerce_cleac_arch/features/home/domain/entites/product_entity.dart';
import 'package:e_commerce_cleac_arch/features/home/domain/home_repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<List<ProductEntity>> getProducts() async {
    final response = await homeRemoteDataSource.getProducts();
    return response;
  }
}
