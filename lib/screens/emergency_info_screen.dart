import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/dummy_data/dummy.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/widgets/emergency_widget.dart';

class EmergencyInformation extends StatelessWidget {
  const EmergencyInformation({
    super.key,
  });

  // final dynamic arguments = Get.arguments;
// final String emergencyType = arguments[''];
  // final String helpNearYou;
  // final String emergencyTip;
  // final String emergencyIcon;
  // final dynamic routeTo;
  @override
  Widget build(BuildContext context) {
    final dynamic arguments = Get.arguments;
    final String emergencyType = arguments['emergencyType'];
    final String helpNearYou = arguments['helpNearYou'];
    final String emergencyTip = arguments['emergencyTip'];
    final String emergencyIcon = arguments['emergencyIcon'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          emergencyType,
          style: const TextStyle(color: AppColors.mainColor),
        ),
        iconTheme: const IconThemeData(color: AppColors.mainColor),
        backgroundColor: AppColors.bgColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingMain),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: AppDimensions.spacing150,
              ),
              EmergencyInfoWidget(
                text: helpNearYou,
                routeTo: AppRoutes.proximalEmergencyPlaces,
                args: {'number': Dummies.police, 'title': helpNearYou},
              ),
              SizedBox(
                height: AppDimensions.spacing20,
              ),
              const EmergencyInfoWidget(
                text: "Officials you can contact",
                routeTo: AppRoutes.emergencyContact,
                args: {'number': Dummies.police},
              ),
              SizedBox(
                height: AppDimensions.spacing20,
              ),
              EmergencyInfoWidget(
                text: emergencyTip,
                routeTo: AppRoutes.emergencyTips,
                args: {'tips': Dummies.tips, 'title':emergencyTip},
              ),
              SizedBox(
                height: AppDimensions.spacing100,
              ),
              Container(
                height: AppDimensions.height300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(emergencyIcon),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
