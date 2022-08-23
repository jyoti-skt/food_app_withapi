import 'dart:async';

import 'package:demo_vehiclebook_app/Utils/dimensions.dart';
import 'package:demo_vehiclebook_app/routes/routes_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/populae_product_controller.dart';
import '../../data/controller/recommended_product_controller.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

   late Animation<double> animation;
   late AnimationController controller;

    Future<void> _loadResources() async {
     await Get.find<PopularProductController>().getPopularProductList();
     await Get.find<RecommendedProductController>().getRecommendedProductList();
   }

   @override
   void initState(){
     super.initState();

     _loadResources();

     controller = new AnimationController(
         vsync: this,
         duration: Duration(seconds: 2))..forward();
     animation = new CurvedAnimation(parent: controller, curve: Curves.linear);
     Timer(
        const Duration(seconds: 3),
         ()=>Get.offNamed(RouteHelper.getInitial())
     );
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
              child: Center(child: Image.asset("assets/images/foood1.png",width: Dimensions.splashImg,))),
          Text(" The Best Food App",style: TextStyle(fontSize: 35,color: Colors.redAccent),)
        ],
      ),
    );
  }
}
