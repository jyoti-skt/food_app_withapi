import 'package:demo_vehiclebook_app/Screens/Home/food_page.dart';
import 'package:demo_vehiclebook_app/Utils/dimensions.dart';
import 'package:flutter/material.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    // this line to know what is the height of current screen
    // print('current height is ' +MediaQuery.of(context).size.height.toString());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            // shows heading page
            Container(
              margin: EdgeInsets.only(top:Dimensions.sizedHeight20,bottom: Dimensions.sizedHeight15),
              padding: EdgeInsets.only(left: Dimensions.sizedWidth20,right: Dimensions.sizedWidth20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                         BigText(text:'Bangalore',color: Colors.teal,),
                          Row(
                            children: [
                              SmallText( text: 'Hello world',),
                              Icon(Icons.arrow_drop_down)
                            ],
                          )
                        ],
                      ),
                      //Text("hello")
                      Center(
                        child: Container(
                          height: Dimensions.sizedHeight50,
                          width: Dimensions.sizedWidth50,
                          child: Icon(Icons.search,color: Colors.white,),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius15),
                            color: Colors.blue,
                            shape: BoxShape.rectangle
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            // shows body
            Expanded(
                child: SingleChildScrollView(child: FoodPage()))
            //shows dotted
          ],
        ),
      ),
    );
  }
}
