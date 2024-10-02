import 'package:dartz/dartz.dart';
import 'package:e_commerce_cleac_arch/core/utils/failure.dart';
import 'package:e_commerce_cleac_arch/core/utils/use_case.dart';
import 'package:e_commerce_cleac_arch/features/home/domain/home_repo/home_repo.dart';

class GetCategoriesUseCase extends UseCase<Either<Failure, List<String>>> {
  final HomeRepo homeRepo;

  GetCategoriesUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<String>>> call() {
    return homeRepo.getCategories();
  }
}
