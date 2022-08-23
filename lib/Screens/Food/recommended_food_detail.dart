import 'package:demo_vehiclebook_app/Utils/dimensions.dart';
import 'package:demo_vehiclebook_app/data/controller/populae_product_controller.dart';
import 'package:demo_vehiclebook_app/data/controller/recommended_product_controller.dart';
import 'package:demo_vehiclebook_app/routes/routes_helper.dart';
import 'package:demo_vehiclebook_app/widgets/app_icon.dart';
import 'package:demo_vehiclebook_app/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Utils/api_constant.dart';
import '../../data/controller/Cart_Product_controller.dart';
import '../../widgets/expandable_text.dart';
import 'Cart.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const RecommendedFoodDetail({Key? key,required this.pageId,required this.page}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedproductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());

    return Scaffold(
      body: CustomScrollView(
        slivers:[
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){

                    //Get.toNamed(RouteHelper.getCartPage());
                    if(page == "cartpage"){
                      Get.toNamed(RouteHelper.getCartPage());
                    }
                    else{
                      Get.toNamed(RouteHelper.getInitial());
                    }
                  },
                  child: AppIcon(icon: Icons.clear),
                ),
               // AppIcon(icon: Icons.shopping_cart)
                GetBuilder<PopularProductController>(builder: (controller){
                  return GestureDetector(
                    onTap: (){
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
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20)),
                  color: Colors.white,
                ),

                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5,bottom: 10),
                child: Center(child: BigText(text: product.name!,)),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.yellow,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(AppConstant.BASE_URL+AppConstant.UPLOAD_URL+product.img!,
              width: double.maxFinite,
              fit: BoxFit.cover,),

            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandedText(text:product.description! ),
                margin: EdgeInsets.only(left: Dimensions.sizedWidth20,right: Dimensions.sizedWidth20),),

              ],
            )
          )
        ]
      ),
      bottomNavigationBar:GetBuilder<PopularProductController>(builder: (controller){
        return  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(left: Dimensions.sizedWidth20*2.5,
                  right: Dimensions.sizedWidth20*2.5,
                  top: Dimensions.sizedHeight10,
                  bottom: Dimensions.sizedHeight10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){

                      controller.setQuantity(false);
                    },
                    child:  AppIcon(icon: Icons.remove,backgroundcolor: Colors.teal,
                      iconcolor: Colors.white,iconsize: Dimensions.iconsize24,),
                  ),
                  BigText(text: "\$ ${product.price!}  X ${controller.inCartItem}",color: Colors.black38,),
                  GestureDetector(
                    onTap: (){
                      controller.setQuantity(true);
                    },
                    child:  AppIcon(icon: Icons.add,backgroundcolor: Colors.teal,
                      iconcolor: Colors.white,iconsize: Dimensions.iconsize24,),
                  )
                ] ,
              ),
            ),
            Container(
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
                  color: Colors.grey[100]
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
                    child:  Icon(Icons.favorite,color: Colors.teal,),
                  ),
                  GestureDetector(
                    onTap: (){
                    controller.addItems(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: Dimensions.sizedHeight10,
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
            ),
          ],
        );
      },)
    );
  }
}
