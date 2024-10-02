import 'package:dartz/dartz.dart';
import 'package:e_commerce_cleac_arch/core/utils/failure.dart';
import 'package:e_commerce_cleac_arch/core/utils/use_case.dart';
import 'package:e_commerce_cleac_arch/features/home/domain/entites/product_entity.dart';
import 'package:e_commerce_cleac_arch/features/home/domain/home_repo/home_repo.dart';

class GetProductsUseCase extends UseCaseWithParam <Either<Failure,List<ProductEntity>>>{
  final HomeRepo homeRepo;

  GetProductsUseCase({required this.homeRepo});
  @override
  Future<Either<Failure,List<ProductEntity>>> call(String? category) {
    return homeRepo.getProducts(category);
  }
}