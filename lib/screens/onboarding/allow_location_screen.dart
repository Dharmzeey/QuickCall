import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/api/allow_location_api.dart';
import 'package:quickcall/controller/location_controller.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';

class AllowLocation extends StatefulWidget {
  const AllowLocation({super.key});

  @override
  State<AllowLocation> createState() => _AllowLocationState();
}

class _AllowLocationState extends State<AllowLocation> {
  final LocationController locationController = Get.put(LocationController());

  bool _isProcessing = false;
  bool _isEnabled = true;

  _triggerLocation() async {
    setState(() {
      _isProcessing = true;
      _isEnabled = false;
    });
    await EnableLocation().setLocation;
    setState(() {
      _isProcessing = false;
      _isEnabled = true;
    });
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
            FilledButton(
                onPressed: () async {
                  if (!locationController.hasPermission) {
                    null;
                  } else if (locationController.hasPermission) {
                    Get.offAndToNamed(AppRoutes.signUp);
                  } else if (_isEnabled) {
                    await _triggerLocation();
                  }
                },
                style: FilledButton.styleFrom(
                  backgroundColor: _isEnabled
                      ? AppColors.buttonColor
                      : AppColors.disabledButtonColor,
                  padding: EdgeInsets.all(AppDimensions.paddingSmall),
                  minimumSize: Size(AppDimensions.screenWidth / 2,
                      AppDimensions.screenHeight / 30),
                ),
                child: _isProcessing
                    ? const CircularProgressIndicator()
                    : (locationController.hasPermission
                        ? Text(
                            "Enable",
                            style: TextStyle(
                              fontSize: AppDimensions.font20,
                              fontWeight: FontWeight.w400,
                              color: _isEnabled
                                  ? AppColors.mainColor
                                  : AppColors.disabledTextColor,
                            ),
                          )
                        : Text(
                            "Location permission denied",
                            style: TextStyle(
                              fontSize: AppDimensions.font20,
                              fontWeight: FontWeight.w400,
                              color: AppColors.disabledTextColor,
                            ),
                          ))),
          ],
        ),
      ),
    );
  }
}
