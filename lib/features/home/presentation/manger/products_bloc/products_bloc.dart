import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entites/product_entity.dart';
import '../../../domain/use_cases/get_products_use_case.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUseCase getProductUseCase;

  ProductsBloc(this.getProductUseCase, )
      : super(ProductsInitial()) {
    on<GetProductEvents>(getProducts);
  }

  Future getProducts(GetProductEvents event,
      Emitter<ProductsState> emit) async {
    emit(ProductsLoading());
    final date = await getProductUseCase.call(event.category);
    date.fold((failure) {
      emit(ProductFailure(err: failure.msg));
    }, (products) {
      emit(ProductSuccess(product: products));
    });
  }

}
