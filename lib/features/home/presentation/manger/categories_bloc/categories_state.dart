part of 'categories_bloc.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoryLoading extends CategoriesState {}

final class CategorySuccess extends CategoriesState {
  final List<String> categories;
  final int? selectedIndex;

  CategorySuccess({required this.categories, this.selectedIndex});
}

final class CategoriesFailure extends CategoriesState {
  final String err;

  CategoriesFailure({required this.err});
}
