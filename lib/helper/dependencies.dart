import 'package:get/get.dart';
import 'package:quickcall/api/allow_location_api.dart';
import 'package:quickcall/controller/location_controller.dart';

Future<void> init() async {
  // Initializes and sets Location
  // Get.lazyPut(() => EnableLocation().setLocation);
  try {
    await EnableLocation().setLocation;
  } catch (e) {
    print("I failed");
    print(e.toString());
  }

  // Controller
  Get.put(LocationController());
}
