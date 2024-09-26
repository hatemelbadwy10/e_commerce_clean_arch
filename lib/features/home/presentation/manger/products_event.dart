part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}
class GetProductEvents extends ProductsEvent{}
