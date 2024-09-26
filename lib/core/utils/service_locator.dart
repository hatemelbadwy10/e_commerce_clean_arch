import 'package:get_it/get_it.dart';
import 'dio_helper.dart';

GetIt locator = GetIt.instance;
void setup(){
  locator.registerSingleton(()=>DioHelper());
}