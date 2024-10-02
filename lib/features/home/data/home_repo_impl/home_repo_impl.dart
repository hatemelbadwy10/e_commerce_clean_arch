import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_cleac_arch/core/utils/failure.dart';
import 'package:e_commerce_cleac_arch/features/home/data/data_source/remote_data_source.dart';
import 'package:e_commerce_cleac_arch/features/home/domain/entites/product_entity.dart';
import 'package:e_commerce_cleac_arch/features/home/domain/home_repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts(String? category) async {
    List<ProductEntity> products;
    try {
      products = await homeRemoteDataSource.getProducts(category);
      return right(products);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(Failure(
          msg: e.message!,
        ));
      }
      else{
        return left(Failure(msg: e.toString()));
      }

    }
  }

  @override
  Future<Either<Failure, List<String>>> getCategories()async {
   List<String>cateogories =[];
   try {
     cateogories= await homeRemoteDataSource.getCategories();
     return right(cateogories);
   } on Exception catch (e) {
     if(e is DioException){
       return left(Failure(msg: e.message!));
     }
     else{
       return left(Failure(msg: e.toString()));
     }
   }

     }
}
