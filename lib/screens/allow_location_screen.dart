import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/api/allow_location_api.dart';
import 'package:quickcall/controller/location_controller.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/widgets/button_widgets.dart';

class AllowLocation extends StatelessWidget {
  AllowLocation({super.key});
  final LocationController locationController = Get.put(LocationController());

  _triggerLocation() async {
    await EnableLocation().setLocation;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: AppDimensions.spacing200,
            ),
            Text(
              "Enable Location",
              style: TextStyle(
                  fontSize: AppDimensions.font32, color: AppColors.mainColor),
            ),
            SizedBox(
              height: AppDimensions.spacing50,
            ),
            Container(
              height: AppDimensions.height300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/locationmap.png"),
                      fit: BoxFit.contain)),
            ),
            SizedBox(height: AppDimensions.spacing50),
            SizedBox(
              width: AppDimensions.width250,
              child: Text(
                "This app makes use of your location to provide the best help during emergency situations",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: AppDimensions.font15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainColor),
              ),
            ),
            SizedBox(
              height: AppDimensions.spacing350,
            ),
            ActionButton(
              text: "Enable",
              routeTo: locationController.hasPermission
                  ? AppRoutes.medicalInformation
                  : AppRoutes.allowLocation,
              isEnabled: true,
              onPressedFunction: _triggerLocation,
            )
          ],
        ),
      ),
    );
  }
}
