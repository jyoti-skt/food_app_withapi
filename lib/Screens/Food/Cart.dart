import 'package:demo_vehiclebook_app/Utils/api_constant.dart';
import 'package:demo_vehiclebook_app/Utils/dimensions.dart';
import 'package:demo_vehiclebook_app/data/controller/Cart_Product_controller.dart';
import 'package:demo_vehiclebook_app/data/controller/populae_product_controller.dart';
import 'package:demo_vehiclebook_app/data/controller/recommended_product_controller.dart';
import 'package:demo_vehiclebook_app/widgets/big_text.dart';
import 'package:demo_vehiclebook_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/routes_helper.dart';
import '../../widgets/app_icon.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top:Dimensions.sizedHeight20*3,
              left:Dimensions.sizedWidth20,
              right:Dimensions.sizedWidth20,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(icon: Icons.arrow_back,
              iconcolor: Colors.white,
              backgroundcolor: Colors.black45,
              iconsize:Dimensions.iconsize24,
              ),
              SizedBox(width: Dimensions.sizedWidth20*5,),
              GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getInitial());
                },
                child: AppIcon(icon: Icons.home_outlined,
                  iconcolor: Colors.white,
                  backgroundcolor: Colors.black45,
                  iconsize:Dimensions.iconsize24,
                ),
              ),

              AppIcon(icon: Icons.add_shopping_cart_outlined,
                iconcolor: Colors.white,
                backgroundcolor: Colors.black45,
                iconsize:Dimensions.iconsize24,
              ),

            ],
          ) ),
          Positioned(
            top: Dimensions.sizedHeight20*5,
              left: Dimensions.sizedWidth20,
              right: Dimensions.sizedWidth20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.sizedHeight20),
                    //  color: Colors.red,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController){
                    var _cartList = cartController.getItems;
                    return ListView.builder(
                        itemCount: _cartList.length,
                        itemBuilder: (_,index){
                          return Container(
                            height: Dimensions.sizedHeight20*5,
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap:(){
                               var popularindex = Get.find<PopularProductController>()
                                   .popularproductList
                                   .indexOf(_cartList[index].product!);
                               if(popularindex>=0){
                                 Get.toNamed(RouteHelper.getPopularFood(popularindex,"cartpage"));
                               }

                               else{
                                 var recommendedindex = Get.find<RecommendedProductController>()
                                     .recommendedproductList.indexOf(_cartList[index].product!);
                                 Get.toNamed(RouteHelper.getPopularFood(recommendedindex,"cartpage"));
                               }
                          },
                                  child: Container(
                                    height: Dimensions.sizedHeight20*5,
                                    width: Dimensions.sizedHeight20*5,
                                    margin: EdgeInsets.only(bottom: Dimensions.sizedWidth10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                               AppConstant.BASE_URL+AppConstant.UPLOAD_URL+cartController.getItems[index].img!
                                            )
                                        ),
                                        borderRadius: BorderRadius.circular(Dimensions.radius20)

                                    ),
                                  ),
                                ),
                                SizedBox(width: Dimensions.sizedWidth20,),
                                Expanded(child: Container(
                                  height:Dimensions.sizedHeight20*5 ,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(text: cartController.getItems[index].name!),
                                      SmallText(text: "Spicy"),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(text:cartController.getItems[index].price!.toString(),color: Colors.redAccent,),
                                          Container(
                                            padding: EdgeInsets.only(top: Dimensions.sizedHeight10,
                                                bottom:Dimensions.sizedHeight10,
                                                left: Dimensions.sizedWidth10,
                                                right: Dimensions.sizedWidth10),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(20)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                GestureDetector(
                                                    onTap:(){
                                                      cartController.addItem(_cartList[index].product!, -1);
                                                      print('being tapped');
                                                      // popularProduct.setQuantity(false);
                                                    },
                                                    child: Icon(Icons.remove)),
                                                SizedBox(width: Dimensions.sizedWidth10/2,),
                                                BigText(text: _cartList[index].quantity.toString()),
                                                //popularProduct.inCartItem.toString()
                                                SizedBox(width: Dimensions.sizedWidth10/2,),
                                                GestureDetector(
                                                    onTap: (){

                                                      cartController.addItem(_cartList[index].product!, 1);
                                                      print('being tapped');
                                                      // popularProduct.setQuantity(true);
                                                    },
                                                    child: Icon(Icons.add))
                                              ],
                                            ),
                                          )
                                        ],
                                      )

                                    ],
                                  ),
                                ))
                              ],
                            ),
                          );
                        }
                    );
                  },)
                ),
          ))
        ],
      ),
        bottomNavigationBar: GetBuilder<CartController>(builder: (cartController){
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

                      SizedBox(width: Dimensions.sizedWidth10/2,),
                      BigText(text: "\$ "+cartController.totalAmount.toString()),
                      SizedBox(width: Dimensions.sizedWidth10/2,),

                    ],
                  ),
                ),
                SizedBox(width: Dimensions.sizedWidth10,),
                GestureDetector(
                  onTap: (){
                    //popularProduct.addItems(product);
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
                    child: BigText(text: ' Check Out',color: Colors.white,),
                  ),
                )
              ],
            ),
          );
        },)
    );
  }
}

