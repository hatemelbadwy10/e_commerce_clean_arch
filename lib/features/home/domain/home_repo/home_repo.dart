import 'package:dartz/dartz.dart';
import 'package:e_commerce_cleac_arch/core/utils/failure.dart';
import 'package:e_commerce_cleac_arch/features/home/domain/entites/product_entity.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<ProductEntity>>> getProducts(String? category);
  Future<Either<Failure,List<String>>>getCategories();
}