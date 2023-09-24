import 'package:get/get.dart';
import 'package:quickcall/api/allow_location_api.dart';
import 'package:quickcall/controller/emergency_info_controller.dart';
import 'package:quickcall/controller/location_controller.dart';

Future<void> init() async {
  // Initializes and sets Location
  // Get.lazyPut(() => EnableLocation().setLocation);
  try {
    await EnableLocation().setLocation;
  } catch (e) {
    throw 'error $e';
  }

  // Controller
  Get.put(LocationController());

// Fetch all the emergencies at launch
  Get.put<EmergencyController>(EmergencyController(emergencyType: 'Medical'),
      tag: 'Medical');
  Get.put<EmergencyController>(EmergencyController(emergencyType: 'Fire'),
      tag: 'Fire');
  Get.put<EmergencyController>(EmergencyController(emergencyType: 'Police'),
      tag: 'Police');
}
