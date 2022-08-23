import 'package:demo_vehiclebook_app/models/products_model.dart';
import 'package:demo_vehiclebook_app/routes/routes_helper.dart';
import 'package:demo_vehiclebook_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/api_constant.dart';
import '../Utils/dimensions.dart';
import '../data/controller/recommended_product_controller.dart';
import 'big_text.dart';
import 'icon_text_widget.dart';
class FoodListView extends StatelessWidget {
  const FoodListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<RecommendedProductController>(builder: (recommendedProducts){
      return   recommendedProducts.isLoaded?ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: recommendedProducts.recommendedproductList.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Get.toNamed(RouteHelper.getRecommendedFood(index,"cartpage"));
              },
              child: Container(
                margin: EdgeInsets.only(left: Dimensions.sizedWidth20,
                    right:Dimensions.sizedWidth20,
                    top: Dimensions.sizedHeight10),

                child: Row(
                  children: [
                    // Image Section
                    Container(
                      height:Dimensions.listviewImagesize,
                      width: Dimensions.listviewImagesize,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(AppConstant.BASE_URL +AppConstant.UPLOAD_URL+recommendedProducts.recommendedproductList[index].img!)),
                      ),
                    ),
                    // Text Section
                    Expanded(
                      child: Container(
                        // height: Dimensions.listviewtextcontainersize,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topRight:Radius.circular(Dimensions.radius20)
                                ,bottomRight:Radius.circular(Dimensions.radius20) )
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: Dimensions.sizedWidth10,right:Dimensions.sizedWidth10 ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(text: recommendedProducts.recommendedproductList[index].name!),
                              SizedBox(height: Dimensions.sizedHeight10,),
                              SmallText(text: 'With Chinese Characxterstics'),
                              SizedBox(height: Dimensions.sizedHeight10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWidget(
                                    icon: Icons.circle_sharp,
                                    iconcolor: Colors.yellow,
                                    text: 'Normal',
                                  ),
                                  IconAndTextWidget(
                                    icon: Icons.location_on,
                                    iconcolor: Colors.green,
                                    text: '1.7km',
                                  ),
                                  IconAndTextWidget(
                                    icon: Icons.access_time_rounded,
                                    iconcolor: Colors.orange,
                                    text: '32min.',
                                  )
                                ],
                              )
                            ],
                          ),
                        ),

                      ),
                    )
                  ],
                ),
              ),
            );

          }):CircularProgressIndicator(
        color: Colors.teal,
      );
    });


  }
}
