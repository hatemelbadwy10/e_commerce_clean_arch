part of 'products_bloc.dart';

sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductSuccess extends ProductsState {
  final List<ProductEntity> product;

  ProductSuccess({required this.product});
}

final class ProductFailure extends ProductsState {
  final String err;

  ProductFailure({required this.err});
}
