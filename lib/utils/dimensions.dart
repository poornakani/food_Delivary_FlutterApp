import 'package:get/get.dart';

class Dimensions{
  //getting size using getx and context
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  // to get the screen/x value take the screen size you want and divide it with widget size 797/220=3.622
// page cintainer details
  static double pageViewContainer = screenHeight/3.622;
  static double pageViewTextContainer = screenHeight/6.64;
  static double pageView = screenHeight/2.49;

  //sizes of heigth and width
  static double height10 = screenHeight/79.7;
  static double heigth30 = screenHeight/25.66;
  static double width10 = screenHeight/79.7;
  static double width15 = screenHeight/53.13;
  static double width20 = screenHeight/39.85;


  //font details
  static double font20 = screenHeight/39.85;

  //radius details
  static double radius20 = screenHeight/39.85;
  static double radius30 = screenHeight/26.66;
  static double radius5 = screenHeight/159.4;


}