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
    final dynamic helpNearYouIcon = arguments['helpNearYouIcon'];
    final String emergencyTip = arguments['emergencyTip'];
    final dynamic emergencyTipIcon = arguments['emergencyTipIcon'];
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
                iconToShow: helpNearYouIcon,
                text: helpNearYou,
                routeTo: AppRoutes.proximalEmergencyPlaces,
                args: {'nearestHelp': Dummies.stations, 'title': helpNearYou},
              ),
              SizedBox(
                height: AppDimensions.spacing20,
              ),
              const EmergencyInfoWidget(
                iconToShow: Icon(
                  Icons.person,
                  color: AppColors.bgColor,
                ),
                text: "Officials you can contact",
                routeTo: AppRoutes.officialsContact,
                args: {'officials': Dummies.officials},
              ),
              SizedBox(
                height: AppDimensions.spacing20,
              ),
              EmergencyInfoWidget(
                iconToShow: emergencyTipIcon,
                text: emergencyTip,
                routeTo: AppRoutes.emergencyTips,
                args: {'tips': Dummies.emergencyTips, 'title': emergencyTip},
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
