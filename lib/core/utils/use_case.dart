abstract class UseCase<Type> {
  Future<Type> call();
}
abstract class UseCaseWithParam<Type> {
  Future<Type> call(String? category);
}