import 'package:demo_vehiclebook_app/Screens/Food/popular_food_detail.dart';
import 'package:demo_vehiclebook_app/Screens/Food/recommended_food_detail.dart';
import 'package:demo_vehiclebook_app/Screens/Home/food_page.dart';
import 'package:demo_vehiclebook_app/Screens/Splash/splash_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../Screens/Food/Cart.dart';
import '../Screens/Home/home_page.dart';

class RouteHelper{

  static const String splashPage = '/splash-page';
  static const String initialRoute = '/';
  static const String popularFood = '/popular-Food';
  static const String recommendedFood = '/recommended-food';
  static const String cartPage = '/cart-page';

  static String getSplash() => '$splashPage';
  static String getInitial() => '$initialRoute';
   static String getPopularFood(int pageId,String page) => '$popularFood?pageId=$pageId&page=$page';
   static String getRecommendedFood(int pageId,String page) => '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';


  static List<GetPage> routes = [

    //splash page

    GetPage(name: splashPage, page: ()=> SplashScreen()),
  GetPage(name: initialRoute, page: ()=> Homepage()),


    // Recommended page
    GetPage(name: recommendedFood, page: (){
      var pageId=Get.parameters['pageId'];
     var page = Get.parameters["Page"];
      return RecommendedFoodDetail(pageId:int.parse(pageId!),page:page??"");
    }),


    //Popular Product Page
    GetPage(name: popularFood, page: (){
      var pageId=Get.parameters['pageId'];
      var page = Get.parameters["Page"];
      return PopularFoodDetail(pageId:int.parse(pageId!),page:page?? "");
  },
  transition:Transition.fadeIn
  ),

    // Cart Page
    GetPage(name: cartPage, page: (){
      return CartPage();
    }, transition:Transition.fadeIn
    ),


  ];
}