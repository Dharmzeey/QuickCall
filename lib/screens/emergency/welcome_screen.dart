import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quickcall/controller/emergency_info_controller.dart';
import 'package:quickcall/controller/location_controller.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/widgets/emergency_widget.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  final LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingMain),
        child: Column(
          children: [
            SizedBox(
              height: AppDimensions.spacing75,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: locationController.hasPermission
                  ? [
                      const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.mainColor,
                      ),
                      Text(
                        locationController.localGovernment,
                        style: TextStyle(
                            fontSize: AppDimensions.font18,
                            color: AppColors.mainColor),
                      )
                    ]
                  : [
                      const Icon(
                        Icons.location_off_outlined,
                        color: AppColors.mainColor,
                      ),
                      Text(
                        'Location Service Unavailable',
                        style: TextStyle(
                            fontSize: AppDimensions.font18,
                            color: AppColors.mainColor),
                      )
                    ],
            ),
            SizedBox(
              height: AppDimensions.spacing100,
            ),
            const CircleAvatar(
              radius: 100,
              child: Image(image: AssetImage("images/avatar_male.png")),
            ),
            SizedBox(
              height: AppDimensions.spacing20,
            ),
            Text(
              "Welcome, Adam",
              style: TextStyle(
                  color: AppColors.mainColor, fontSize: AppDimensions.font24),
            ),
            SizedBox(
              height: AppDimensions.spacing150,
            ),
            Text(
              "WHAT IS YOUR EMERGENCY??",
              style: TextStyle(
                  fontSize: AppDimensions.font24, color: AppColors.mainColor),
            ),
            SizedBox(
              height: AppDimensions.spacing50,
            ),
            EmergencyTypeWidget(
              imageUrl: "images/police.png",
              text: "POLICE",
              bgColor: const Color.fromRGBO(55, 55, 55, 1),
              args: {
                'emergencyType': 'Police Emergency',
                'helpNearYou': 'Police Stations near you',
                'helpNearYouIcon': const FaIcon(
                  FontAwesomeIcons.building,
                  color: AppColors.iconMainColor,
                ),
                'emergencyLines': 'Police Emergency lines in your location',
                'emergencyLinesIcon': const Icon(
                  Icons.phonelink_ring_sharp,
                  color: AppColors.iconMainColor,
                ),
                'emergencyTip': 'Things you can do during police emergency',
                'emergencyTipIcon': const Icon(
                  Icons.dangerous,
                  color: AppColors.iconMainColor,
                ),
                'emergencyIcon': 'images/police_device.png',
                'controller': Get.find<EmergencyController>(tag: 'Police'),
              },
            ),
            SizedBox(
              height: AppDimensions.spacing30,
            ),
            EmergencyTypeWidget(
                imageUrl: "images/medics.png",
                text: "MEDICAL",
                bgColor: const Color.fromRGBO(0, 56, 254, 1),
                args: {
                  'emergencyType': 'Medical Emergency',
                  'helpNearYou': 'Hospitals / Medical centers near you',
                  'helpNearYouIcon': const FaIcon(
                    FontAwesomeIcons.truckMedical,
                    color: AppColors.iconMainColor,
                  ),
                  'emergencyLines': 'Medical Emergency lines in your location',
                  'emergencyLinesIcon': const Icon(
                    Icons.phonelink_ring_sharp,
                    color: AppColors.iconMainColor,
                  ),
                  'emergencyTip': 'First aid tips for emergency situations',
                  'emergencyTipIcon': const FaIcon(
                    FontAwesomeIcons.kitMedical,
                    color: AppColors.iconMainColor,
                  ),
                  'emergencyIcon': 'images/medical_insurance.png',
                  'controller': Get.find<EmergencyController>(tag: 'Medical'),
                }),
            SizedBox(
              height: AppDimensions.spacing30,
            ),
            EmergencyTypeWidget(
              imageUrl: "images/fire.png",
              text: "FIRE",
              bgColor: const Color.fromRGBO(254, 0, 0, 1),
              args: {
                'emergencyType': 'Fire Emergency',
                'helpNearYou': 'Fire Stations near you',
                'helpNearYouIcon': const FaIcon(
                  FontAwesomeIcons.truckFieldUn,
                  color: AppColors.iconMainColor,
                ),
                'emergencyLines': 'Fire Emergency lines in your location',
                'emergencyLinesIcon': const Icon(
                  Icons.phonelink_ring_sharp,
                  color: AppColors.iconMainColor,
                ),
                'emergencyTip': 'Tips to prevent and handle fire outbreak',
                'emergencyTipIcon': const FaIcon(
                  FontAwesomeIcons.fire,
                  color: AppColors.iconMainColor,
                ),
                'emergencyIcon': 'images/fire_extinguish.png',
                'controller': Get.find<EmergencyController>(tag: 'Fire'),
              },
            )
          ],
        ),
      ),
    );
  }
}