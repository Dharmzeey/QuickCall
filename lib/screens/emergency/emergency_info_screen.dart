import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/controller/emergency_info_controller.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/widgets/emergency_widget.dart';

class EmergencyInformation extends StatelessWidget {
  const EmergencyInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = Get.arguments;
    final String emergencyType = arguments['emergencyType'];
    final String helpNearYou = arguments['helpNearYou'];
    final dynamic helpNearYouIcon = arguments['helpNearYouIcon'];
    final String emergencyLines = arguments['emergencyLines'];
    final dynamic emergencyLinesIcon = arguments['emergencyLinesIcon'];
    final String emergencyTip = arguments['emergencyTip'];
    final dynamic emergencyTipIcon = arguments['emergencyTipIcon'];
    final String emergencyIcon = arguments['emergencyIcon'];
    final EmergencyController controller = arguments['controller'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          emergencyType,
          style: TextStyle(
            color: AppColors.mainColor,
            fontSize: AppDimensions.font20,
          ),
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
                height: AppDimensions.spacing100,
              ),
              EmergencyInfoWidget(
                iconToShow: helpNearYouIcon,
                text: helpNearYou,
                routeTo: AppRoutes.proximalEmergencyPlaces,
                args: {
                  'nearestHelp': controller.nearbyPlaces,
                  'title': helpNearYou
                },
              ),
              SizedBox(
                height: AppDimensions.spacing10,
              ),
              EmergencyInfoWidget(
                  text: emergencyLines,
                  routeTo: AppRoutes.emergencyLines,
                  args: {
                    'emergencyName': emergencyLines.split(' ')[0],
                    'emergencyLines': controller.emergencyContacts,
                    'title': "Emergency Contacts"
                  },
                  iconToShow: emergencyLinesIcon),
              SizedBox(
                height: AppDimensions.spacing10,
              ),
              EmergencyInfoWidget(
                iconToShow: const Icon(
                  Icons.person,
                  color: AppColors.bgColor,
                ),
                text: "Officials you can contact",
                routeTo: AppRoutes.officialsContact,
                args: {'officials': controller.notablePeople},
              ),
              SizedBox(
                height: AppDimensions.spacing10,
              ),
              EmergencyInfoWidget(
                iconToShow: emergencyTipIcon,
                text: emergencyTip,
                routeTo: AppRoutes.specificEmergencyTips,
                args: {'tips': controller.emergencyTips, 'title': emergencyTip},
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
