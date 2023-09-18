import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/controller/location_controller.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/utils/styles.dart';

class EmergencyTypeWidget extends StatelessWidget {
  EmergencyTypeWidget(
      {super.key,
      required this.text,
      required this.bgColor,
      required this.imageUrl,
      required this.args});
  final String text;
  final Color bgColor;
  final String imageUrl;
  final Map<String, dynamic> args;

  final LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppDimensions.spacing20),
      child: Row(
        children: [
          Image(image: AssetImage(imageUrl)),
          SizedBox(
            width: AppDimensions.spacing20,
          ),
          FilledButton(
            onPressed: () {
              if (locationController.hasPermission) {
                Get.toNamed(AppRoutes.emergencyInfo, arguments: args);
              } else {
                Get.snackbar(
                    "Location Disabled", "Please enable location service",
                    colorText: AppColors.mainColor);
              }
            },
            style: FilledButton.styleFrom(
                backgroundColor: bgColor,
                padding: EdgeInsets.all(AppDimensions.paddingSmall),
                minimumSize: Size(AppDimensions.screenWidth / 1.5,
                    AppDimensions.screenHeight / 30)),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: AppDimensions.font20, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}

class EmergencyInfoWidget extends StatelessWidget {
  const EmergencyInfoWidget(
      {super.key,
      required this.text,
      required this.routeTo,
      required this.args,
      required this.iconToShow});
  final dynamic iconToShow;
  final String text;
  final dynamic routeTo;
  final Map<String, dynamic> args;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.paddingSmall),
      child: FilledButton(
          onPressed: () {
            Get.toNamed(routeTo, arguments: args);
          },
          style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              backgroundColor: AppColors.mainColor,
              padding: EdgeInsets.all(AppDimensions.paddingSmall),
              minimumSize: Size(AppDimensions.screenWidth / 1.5,
                  AppDimensions.screenHeight / 30)),
          child: Row(
            children: [
              iconToShow,
              SizedBox(width: AppDimensions.spacing10),
              Text(
                text,
                style: CustomTextStyles.primaryTextStyle
                    .copyWith(color: AppColors.bgColor),
              ),
            ],
          )),
    );
  }
}
