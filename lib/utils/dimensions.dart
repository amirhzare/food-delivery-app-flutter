import 'package:get/get.dart';

class Dimensions{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewContainer = screenHeight / 3.84;
  static double pageView = screenHeight / 2.7;
  static double pageViewTextContainer = screenWidth / 3.2;

  static double height10 = screenHeight/84.4;
  static double height15 = screenHeight/56.27;
  static double height20 = screenHeight/42.2;

  static double width5 = screenHeight/160;
  static double width10 = screenHeight/84.4;
  static double width15 = screenHeight/56.27;
  static double width20 = screenHeight/42.2;
  static double width30 = screenHeight/28.13;

  static double font20 = screenHeight/42.2;

  static double radius10 = screenHeight/84.4;
  static double radius15 = screenHeight/42.2;
  static double radius20 = screenHeight/42.2;
  static double radius30 = screenHeight/28.13;

  // list view
  static double listViewImgSize = screenWidth/3.3;
  static double listViewTextContainerSize = screenWidth/3.9;
}