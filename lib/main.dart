import 'package:demo_vehiclebook_app/data/controller/populae_product_controller.dart';
import 'package:demo_vehiclebook_app/routes/routes_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Screens/Food/Cart.dart';
import 'Screens/Food/recommended_food_detail.dart';
import 'Screens/Home/main_food_page.dart';
import 'Screens/Splash/splash_page.dart';
import 'data/controller/recommended_product_controller.dart';
import 'helper/dependancy.dart' as dep;



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // Get.find<PopularProductController>().getPopularProductList();
    // Get.find<RecommendedProductController>().getRecommendedProductList();


     return GetBuilder<PopularProductController>(builder: (_){
       return GetBuilder<RecommendedProductController>(builder: (_){
         return GetMaterialApp(
           debugShowCheckedModeBanner: false,
           title: 'Flutter Demo',
           //home:SplashScreen(),
           initialRoute: RouteHelper.getSplash(),
           getPages: RouteHelper.routes,
         );
       });
     });
    // return GetMaterialApp(
    //   title: 'Flutter Demo',
    //   //home:SplashScreen(),
    //   initialRoute: RouteHelper.getSplash(),
    //   getPages: RouteHelper.routes,
    // );
  }
}

