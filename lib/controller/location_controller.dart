import 'package:get/get.dart';

class LocationController extends GetxController {
  String currentLatitude = "";
  String currentLongitude = "";
  RxString localGovernment = "".obs;
  String currentAddress = "";
  bool hasPermission = false;

  
}
