import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../domain/entites/product_entity.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<GetProductEvents>(getProducts);
  }
  Future getProducts(GetProductEvents event, Emitter<ProductsState>emitter)async{

  }
}
