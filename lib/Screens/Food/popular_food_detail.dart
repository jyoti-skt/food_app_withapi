
import 'package:demo_vehiclebook_app/Utils/api_constant.dart';
import 'package:demo_vehiclebook_app/Utils/dimensions.dart';
import 'package:demo_vehiclebook_app/data/controller/Cart_Product_controller.dart';
import 'package:demo_vehiclebook_app/data/controller/populae_product_controller.dart';
import 'package:demo_vehiclebook_app/widgets/app_icon.dart';
import 'package:demo_vehiclebook_app/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../routes/routes_helper.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';

class PopularFoodDetail extends StatelessWidget {
   final int pageId;
   final String page;

   PopularFoodDetail({Key? key,required this.pageId,required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularproductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
    // print('page id is' +pageId.toString());
    // print('product name is' +product.name.toString());

    return Scaffold(
      body:SafeArea(
        child: Stack(
          children: [
            //backgroung image
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  height: Dimensions.popularFoodImageSize,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppConstant.BASE_URL+AppConstant.UPLOAD_URL+product.img!)
                    )
                  ),

            )),
            //icon widget
            Positioned(
              top: Dimensions.sizedHeight30,
              left: Dimensions.sizedWidth20,
                right: Dimensions.sizedWidth20,
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){

                   // Get.toNamed(RouteHelper.getCartPage());
                    // Get.toNamed(RouteHelper.getInitial());
                    if(page == "cartpage"){
                      Get.toNamed(RouteHelper.getCartPage());
                    }
                    else{
                      Get.toNamed(RouteHelper.getInitial());
                    }
                  },
                  child: AppIcon(icon: Icons.arrow_back),
                ),
                GetBuilder<PopularProductController>(builder: (controller){
                  return GestureDetector(
                    onTap: (){
                      print("log here");
                      if(controller.totalItems >= 1)
                      Get.toNamed(RouteHelper.getCartPage());
                    },
                    child: Stack(
                      children: [
                         AppIcon(icon: Icons.shopping_cart),
                        controller.totalItems >=1 ?
                        Positioned(
                              right:0,top:0,
                              child: AppIcon(icon: Icons.circle,size: 20,
                                iconcolor: Colors.transparent,backgroundcolor: Colors.black38,),

                        )
                              :Container(),
                        Get.find<PopularProductController>().totalItems >=1 ?
                        Positioned(
                            right:3,top:3,
                            child: BigText(
                              text: Get.find<PopularProductController>().totalItems.toString(),
                              size: 12,color: Colors.white,
                            ),
                        ):Container()
                      ],
                    ),
                  );
                })

              ],
            )),
            //intoduction font
            Positioned(
              left: 0,
                right: 0,
                bottom: 0,
                top: Dimensions.popularFoodImageSize-20,
                child: Container(
                  padding: EdgeInsets.only(left: Dimensions.sizedWidth20,
                  right: Dimensions.sizedWidth20,
                  top: Dimensions.sizedHeight20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),
                    ),
                    color: Colors.white
                  ),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text: product.name!),
                      SizedBox(height: Dimensions.sizedHeight20,),
                      BigText(text: 'Introduce'),
                      Expanded(child: SingleChildScrollView(child: ExpandedText(

                        text:product.description! ,)))

                    ],
                  )
                )),
            // Expnadable Text
          ],
        ),
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
          // height: 80,
          height: Dimensions.bottomnavigationbarheight,
          padding: EdgeInsets.only(top: Dimensions.sizedHeight30,
              bottom: Dimensions.sizedHeight30,
              left: Dimensions.sizedWidth20,
              right: Dimensions.sizedWidth20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.radius20*2),
                topLeft: Radius.circular(Dimensions.radius20*2),
              ),
              color: Colors.grey[200]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: Dimensions.sizedHeight10,
                    bottom:Dimensions.sizedHeight10,
                    left: Dimensions.sizedWidth20,
                    right: Dimensions.sizedWidth20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:(){
                        popularProduct.setQuantity(false);
        },
                        child: Icon(Icons.remove)),
                    SizedBox(width: Dimensions.sizedWidth10/2,),
                    BigText(text: popularProduct.inCartItem.toString()),
                    SizedBox(width: Dimensions.sizedWidth10/2,),
                    GestureDetector(
                      onTap: (){
                        popularProduct.setQuantity(true);
                      },
                        child: Icon(Icons.add))
                  ],
                ),
              ),
              SizedBox(width: Dimensions.sizedWidth10,),
              GestureDetector(
                onTap: (){
                  popularProduct.addItems(product);
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.sizedHeight10,
                      bottom:Dimensions.sizedHeight10,
                      left: Dimensions.sizedWidth20,
                      right: Dimensions.sizedWidth20),
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(Dimensions.radius20)
                  ),
                      child: BigText(text: '\$ ${product.price!} | Add To Cart',color: Colors.white,),
                ),
              )
            ],
          ),
        );
      },)
    );
  }
}
