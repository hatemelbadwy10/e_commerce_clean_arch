part of 'products_bloc.dart';

sealed class ProductsEvent {}
class GetProductEvents extends ProductsEvent{
 final String? category;

  GetProductEvents({ this.category});
}
