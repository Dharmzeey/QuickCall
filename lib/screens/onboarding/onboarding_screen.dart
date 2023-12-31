import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/utils/styles.dart';
import 'package:quickcall/widgets/button_widgets.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: AppDimensions.screenHeight,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/onboard.jpeg"),
                    fit: BoxFit.cover)),
          ),
          Container(
            height: AppDimensions.screenHeight,
            decoration: const BoxDecoration(
              // color: Colors.white,
              gradient: LinearGradient(
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
                colors: [Colors.black, Colors.black87, Colors.black12],
                stops: [0.0, 0.3, 1.0],
              ),
            ),
          ),
          Positioned(
              top: AppDimensions.spacing200,
              child: Padding(
                padding: EdgeInsets.all(AppDimensions.paddingMain),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome...",
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: AppDimensions.font32),
                    ),
                    SizedBox(height: AppDimensions.spacing30),
                    SizedBox(
                      width: AppDimensions.width350,
                      child: Text(
                        "Emergency assistance made simple. Safety, security and support",
                        style: CustomTextStyles.primaryTextStyle
                            .copyWith(fontSize: AppDimensions.font20),
                      ),
                    )
                  ],
                ),
              )),
          Padding(
            padding: EdgeInsets.only(bottom: AppDimensions.spacing150),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ActionButton(
                      text: "Continue",
                      isEnabled: true,
                      isProcessing: false,
                      onPressedFunction: onBoarded)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onBoarded() {
    Get.toNamed(AppRoutes.allowLocation);
  }
}
