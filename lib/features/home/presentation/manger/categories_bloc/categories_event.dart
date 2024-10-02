part of 'categories_bloc.dart';

@immutable
sealed class CategoriesEvent {}
class GetCategoriesEvent extends CategoriesEvent{}

final class SelectCategoryEvent extends CategoriesEvent {
  final int? selectedIndex;

  SelectCategoryEvent(this.selectedIndex);
}