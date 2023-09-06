import 'package:get/get.dart';

class AppDimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double font32 = screenHeight / 42.18;

  static double font24 = screenHeight / 56.25;
  static double font20 = screenHeight / 67.5;
  static double font18 = screenHeight / 75;

  static double paddingSmall = screenHeight / 79.4;
  static double paddingMain = screenWidth / 20;

  static double spacing150 = screenHeight / 9;
  static double spacing100 = screenHeight / 13.5;
  static double spacing50 = screenHeight / 27;
  static double spacing20 = screenHeight / 67.5;

  static double width225 = screenWidth / 2;
  // static double width400 = screenWidth / 2;

  static double divideBy14 = screenWidth / 14;
}
