import 'package:demo_vehiclebook_app/data/repositry/popular_product_repositry.dart';
import 'package:get/get.dart';

import '../../models/products_model.dart';
import '../repositry/recommended_product_repositry.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this. recommendedProductRepo});

  List<dynamic> _recommendedproductList = [];
  List<dynamic> get recommendedproductList => _recommendedproductList;

  bool _isLoaded= false;
  bool  get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList()async {
    Response response = await  recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode == 200){
      print('print  recommended got result');
      _recommendedproductList=[];
      _recommendedproductList.addAll(Product.fromJson(response.body).products);
      // print(_popularproductList);
      _isLoaded = true;
      update();
    }else{
   print('could not find');
    }

  }

}