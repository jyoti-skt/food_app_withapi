import 'package:demo_vehiclebook_app/Utils/api_constant.dart';
import 'package:demo_vehiclebook_app/data/api/api_client.dart';
import 'package:demo_vehiclebook_app/data/controller/Cart_Product_controller.dart';
import 'package:demo_vehiclebook_app/data/controller/populae_product_controller.dart';
import 'package:demo_vehiclebook_app/data/repositry/Cart_product_repositry.dart';
import 'package:demo_vehiclebook_app/data/repositry/popular_product_repositry.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/controller/recommended_product_controller.dart';
import '../data/repositry/recommended_product_repositry.dart';


Future<void> init()async{

  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(() => ApiClient(apibaseUrl: AppConstant.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}