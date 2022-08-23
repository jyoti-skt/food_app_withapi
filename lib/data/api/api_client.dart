import 'package:demo_vehiclebook_app/Utils/api_constant.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {

  late final String token;
  late final String apibaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.apibaseUrl}){
    baseUrl = apibaseUrl;
    timeout = Duration(seconds: 30);
    token=AppConstant.TOKEN;
    _mainHeaders ={
      'Content-type' :'application/json; charset=UTF-8',
      'Authorization' :'Bearer $token'
    };
  }

  Future<Response> getData(String uri) async {
    try{
   Response response = await get(uri);
   return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString());

    }
  }

}