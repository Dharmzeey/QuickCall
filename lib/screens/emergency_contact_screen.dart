import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/controller/location_controller.dart';

class EmergencyContact extends StatelessWidget {
  EmergencyContact({super.key});
  final LocationController locationController = Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          locationController.currentAddress.isNotEmpty
              ? Text(locationController.currentAddress)
              : const Text("Null"),
        ],
      )),
    );
  }
}
