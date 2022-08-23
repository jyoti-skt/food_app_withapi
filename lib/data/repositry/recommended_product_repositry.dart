import 'package:demo_vehiclebook_app/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../Utils/api_constant.dart';

class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient ;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async{
    return await apiClient.getData(AppConstant.POPULAR_PRODUCT_URL);

  }
}