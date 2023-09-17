import 'package:get/get.dart';

class AppDimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double font32 = screenHeight / 42.18;
  static double font24 = screenHeight / 56.25;
  static double font20 = screenHeight / 67.5;
  static double font18 = screenHeight / 75;
  static double font15 = screenHeight / 90;

  static double paddingSmall = screenHeight / 79.4;
  static double paddingMain = screenWidth / 20;

  static double spacing350 = screenHeight / 3.8;
  static double spacing250 = screenHeight / 5.4;
  static double spacing200 = screenHeight / 6.75;
  static double spacing150 = screenHeight / 9;
  static double spacing120 = screenHeight / 11.25;
  static double spacing100 = screenHeight / 13.5;
  static double spacing75 = screenHeight / 18;
  static double spacing50 = screenHeight / 27;
  static double spacing30 = screenHeight / 45;
  static double spacing20 = screenHeight / 67.5;
  static double spacing10 = screenHeight / 135;

  static double height300 = screenHeight / 4.5;
  static double height200 = screenHeight / 6.75;
  static double height120 = screenHeight / 11.25;
  static double height100 = screenHeight / 13.5;

  static double width350 = screenWidth / 1.42;
  static double width250 = screenWidth / 2;
  static double width225 = screenWidth / 2.2;

  static double divideBy14 = screenWidth / 14;
}
