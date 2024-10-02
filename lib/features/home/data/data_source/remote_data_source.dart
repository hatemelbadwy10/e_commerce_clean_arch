import 'package:e_commerce_cleac_arch/constants.dart';
import 'package:e_commerce_cleac_arch/core/utils/dio_helper.dart';
import 'package:e_commerce_cleac_arch/features/home/domain/entites/product_entity.dart';
import '../models/product_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductEntity>> getProducts(String?category);
  Future<List<String>>getCategories();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
 final DioHelper dioHelper;

  HomeRemoteDataSourceImpl({required this.dioHelper});
  @override
  Future<List<ProductEntity>> getProducts(String? category) async {
    List<ProductEntity> products = [];
    String url = category != null
        ? "${EndPoints.products}/category/$category"
        : EndPoints.products;
    var data =
        await dioHelper.getFromServer(url: url);
    for (var item in data) {
      products.add(ProductModel.fromJson(item));
    }
    return products;
  }

  @override
  Future<List<String>> getCategories() async{
   List<String>categories=[];
   var data =await dioHelper.getFromServer(url: EndPoints.categories);
   for(String category in data){
     categories.add(category);
   }
   return categories;
  }
}
