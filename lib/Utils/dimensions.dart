import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Dimensions{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;


  //683.42/220 = 3.10 this food_page
  static double pageViewContainer = screenHeight/3.10;
//683.42/120 = 5.69
  static double pageViewContainerText = screenHeight/5.69;
//683.42/320 = 2.11
  static double pageView = screenHeight/2.11;


  // dynamic height for padding and margin
  static double sizedHeight10=screenHeight/68.34;
  static double sizedHeight15=screenHeight/45.56;
  static double sizedHeight20=screenHeight/34.17;
  static double sizedHeight50=screenHeight/13.66;
  static double sizedHeight30=screenHeight/22.78;


  // dynamic width for padding and margin
  static double sizedWidth10=screenHeight/68.34;
  static double sizedWidth15=screenHeight/45.56;
  static double sizedWidth20=screenHeight/34.17;
  static double sizedWidth50=screenHeight/13.66;
  static double sizedWidth30=screenHeight/22.78;



  static double font24 = screenHeight/28.47;
  static double font14 = screenHeight/48.14;

  static double radius20 = screenHeight/34.17;
  static double radius30 = screenHeight/22.78;
  static double radius15 = screenHeight/45.56;

  static double iconsize20 = screenHeight/34.17;
  static double iconsize16 = screenHeight/42.71;
  static double iconsize24 = screenHeight/28.47;



  //List View Food Item
  static double listviewContainer = screenHeight/0.75;
  static double listviewImagesize = screenHeight/5.69;
  static double listviewtextcontainersize = screenHeight/6.83;



  //Popular Food Detail
static double popularFoodImageSize = screenHeight/1.98;

static double bottomnavigationbarheight= screenHeight/6.69;

//spa=lash screen Dimensions

static double splashImg = screenHeight/2.73;



}