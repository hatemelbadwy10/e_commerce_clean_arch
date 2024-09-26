import 'package:e_commerce_cleac_arch/constants.dart';
import 'package:e_commerce_cleac_arch/core/utils/dio_helper.dart';
import 'package:e_commerce_cleac_arch/features/home/domain/entites/product_entity.dart';

import '../../../../core/utils/service_locator.dart';
import '../models/product_model.dart';

abstract class HomeRemoteDataSource{

  Future <List<ProductEntity>>getProducts();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  @override
  Future<List<ProductEntity>> getProducts() async {
    List<ProductEntity>products=[];
    var data =await locator<DioHelper>().getFromServer(url: EndPoints.products);
    for(var item in data.response!.data){
      products.add(ProductModel.fromJson(item) as ProductEntity);
    }
    return products;
  }
}