import 'package:flutter/material.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/widgets/emergency_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: AppColors.mainColor,
                ),
                Text(
                  "Ibadan North",
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
            const EmergencyWidget(
              imageUrl: "images/police.png",
              text: "POLICE",
              bgColor: Color.fromRGBO(55, 55, 55, 1),
              routeTo: AppRoutes.emergencyContact,
            ),
            SizedBox(
              height: AppDimensions.spacing30,
            ),
            const EmergencyWidget(
              imageUrl: "images/medics.png",
              text: "MEDIACL",
              bgColor: Color.fromRGBO(0, 56, 254, 1),
              routeTo: AppRoutes.emergencyContact,
            ),
            SizedBox(
              height: AppDimensions.spacing30,
            ),
            const EmergencyWidget(
              imageUrl: "images/fire.png",
              text: "FIRE",
              bgColor: Color.fromRGBO(254, 0, 0, 1),
              routeTo: AppRoutes.emergencyContact,
            )
          ],
        ),
      ),
    );
  }
}
