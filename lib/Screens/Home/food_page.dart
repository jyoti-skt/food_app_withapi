
import 'package:demo_vehiclebook_app/Utils/api_constant.dart';
import 'package:demo_vehiclebook_app/Utils/dimensions.dart';
import 'package:demo_vehiclebook_app/data/controller/populae_product_controller.dart';
import 'package:demo_vehiclebook_app/models/products_model.dart';
import 'package:demo_vehiclebook_app/routes/routes_helper.dart';
import 'package:demo_vehiclebook_app/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/food_item_list_view.dart';
import '../../widgets/icon_text_widget.dart';
class FoodPage extends StatefulWidget {

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
   PageController pageController = PageController(viewportFraction: 0.85);
   var currentpagevalue = 0.0;
   double _scaleFactor = 0.8;
   double _height = 220;


   @override
   void initState(){
     super.initState();
     pageController.addListener(() {
       setState((){
         currentpagevalue=pageController.page!;
        // print('current value is : ' + currentpagevalue.toString());
       });
     });
   }

   @override
   void dispose(){
     pageController.dispose();
     super.dispose();
   }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        GetBuilder<PopularProductController>(builder: (popularProducts){
return popularProducts.isLoaded?  Container(
  height: Dimensions.pageView,
  child: PageView.builder(

      controller: pageController,
      itemCount:popularProducts.popularproductList.length ,
      itemBuilder: (context,position){
          return _buildPageItem(position,popularProducts.popularproductList[position]);
      }),
):CircularProgressIndicator(
  color: Colors.teal,
);
          }),
        // dot section
        GetBuilder<PopularProductController>(builder: (popularProducts){
      return  DotsIndicator(
        dotsCount: popularProducts.popularproductList.isEmpty?1:popularProducts.popularproductList.length,
        position: currentpagevalue,
        decorator: DotsDecorator(
          activeColor: Colors.red,
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      );
    }),
        // popular section
        Container(
          margin: EdgeInsets.only(left: Dimensions.sizedHeight20),
          child: Row(
            children: [
              BigText(text: 'Recommended'),
              SizedBox(width: Dimensions.sizedWidth10,),
              Container(child: SmallText(text: 'Food Pairing'))
            ],
          ),
        ),
        // Items List Image Container and Text Container
        // recommended food list
        FoodListView(),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProducts){

     // This Code etarnsform the Page shifting like 1 page to another page
    // we can see the animation feeling
    // for that we will use thr transform and this code
      Matrix4 matrix =  new Matrix4.identity();
      if(index == currentpagevalue.floor()){
        var currscale = 1-(currentpagevalue-index)*(1-_scaleFactor);
        var currTrans = _height*(1-currscale)/2;
        matrix =Matrix4.diagonal3Values(1, currscale, 1)..setTranslationRaw(0, currTrans, 0);
      }
      else if(index == currentpagevalue.floor()+1) {
        var currscale = _scaleFactor+(currentpagevalue-index+1)*(1-_scaleFactor);
        var currTrans = _height*(1-currscale)/2;
        matrix =Matrix4.diagonal3Values(1, currscale, 1);
        matrix =Matrix4.diagonal3Values(1, currscale, 1)..setTranslationRaw(0, currTrans, 0);
      }
      else if(index == currentpagevalue.floor()-1) {
        var currscale = 1-(currentpagevalue-index)*(1-_scaleFactor);
        var currTrans = _height*(1-currscale)/2;
        matrix =Matrix4.diagonal3Values(1, currscale, 1);
        matrix =Matrix4.diagonal3Values(1, currscale, 1)..setTranslationRaw(0, currTrans, 0);
      } else{
        var currScale = 0.8;
        matrix =Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
      }


    return Transform(
      transform: matrix,
      child: Stack(
        children: [
        GestureDetector(
          onTap: (){
            Get.toNamed(RouteHelper.getPopularFood(index,"home"));
          },
          child: Container(
            //pageViewContainer
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(left: Dimensions.sizedWidth10,right:Dimensions.sizedWidth10 ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            color: index.isEven ?Colors.red : Colors.amber,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(AppConstant.BASE_URL +"/uploads/"+popularProducts.img!)),
          ),

      ),
        ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              //5.69
              height: Dimensions.pageViewContainerText,
              margin: EdgeInsets.only(left: Dimensions.sizedWidth30,
                  right: Dimensions.sizedWidth30,
                  bottom: Dimensions.sizedHeight30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0,5)
                  ),
                  BoxShadow(
                      color: Colors.white,
                     // blurRadius: 5.0,
                      offset: Offset(-5,0)
                  ),
                  BoxShadow(
                      color: Colors.white,
                     // blurRadius: 5.0,
                      offset: Offset(5,0)
                  ),

                ]
                // image: DecorationImage(
                //     fit: BoxFit.cover,
                //     image: AssetImage('assets/images/foood1.png')),
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: Dimensions.sizedWidth15,
                      right: Dimensions.sizedWidth15,top: Dimensions.sizedHeight15),
                  child: AppColumn(text: popularProducts.name!,)
                ),
              ),

            ),
          )
        ],
      ),
    );
  }
}
