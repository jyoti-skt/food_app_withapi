import 'package:demo_vehiclebook_app/Utils/api_constant.dart';
import 'package:demo_vehiclebook_app/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient ;
   PopularProductRepo({required this.apiClient});

   Future<Response> getPopularProductList() async{
     return await apiClient.getData(AppConstant.POPULAR_PRODUCT_URL);

   }
}