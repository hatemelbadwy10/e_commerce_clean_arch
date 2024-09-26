import 'package:e_commerce_cleac_arch/core/utils/use_case.dart';
import 'package:e_commerce_cleac_arch/features/home/domain/entites/product_entity.dart';
import 'package:e_commerce_cleac_arch/features/home/domain/home_repo/home_repo.dart';

class HomeRepoUseCase extends UseCase <List<ProductEntity>>{
  final HomeRepo homeRepo;

  HomeRepoUseCase({required this.homeRepo});
  @override
  Future<List<ProductEntity>> call() {
    return homeRepo.getProducts();
  }
}