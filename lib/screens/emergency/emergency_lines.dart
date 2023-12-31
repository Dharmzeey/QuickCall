import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/utils/launchers.dart';
import 'package:quickcall/utils/styles.dart';

class EmergencyLines extends StatelessWidget {
  const EmergencyLines({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = Get.arguments;
    final String title = arguments['title'];
    final emergencyLines = List<dynamic>.from(arguments['emergencyLines']);
    final emergencyName = arguments['emergencyName'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
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
        child: Column(
          children: [
            SizedBox(
              height: AppDimensions.spacing30,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: emergencyLines.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingSmall),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 2, color: AppColors.mainColor),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.phone_in_talk_rounded,
                          color: AppColors.mainColor,
                          size: AppDimensions.font32,
                        ),
                        Text(
                          emergencyLines[index].emergencyNo,
                          style: CustomTextStyles.primaryTextStyle
                              .copyWith(fontSize: AppDimensions.font18),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: AppDimensions.spacing50,
                              child: IconButton(
                                onPressed: () {
                                  openWhatsAppChat(
                                      emergencyLines[index].whatsappContact);
                                  showCustomDialogue(emergencyName,
                                      emergencyLines[index].whatsappContact);
                                },
                                icon: FaIcon(
                                  FontAwesomeIcons.whatsapp,
                                  color: AppColors.mainColor,
                                  size: AppDimensions.font32,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: AppDimensions.spacing50,
                              child: IconButton(
                                onPressed: () {
                                  final bodyMessage =
                                      'Quick Call, A $emergencyName Emergency...';
                                  openSMS(emergencyLines[index].whatsappContact,
                                      bodyMessage);
                                  showCustomDialogue(emergencyName,
                                      emergencyLines[index].whatsappContact);
                                },
                                icon: Icon(
                                  Icons.message,
                                  color: AppColors.mainColor,
                                  size: AppDimensions.font32,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: AppDimensions.spacing50,
                              child: IconButton(
                                onPressed: () {
                                  openPhoneDialer(
                                      emergencyLines[index].emergencyNo);
                                  showCustomDialogue(emergencyName,
                                      emergencyLines[index].emergencyNo);
                                },
                                icon: Icon(
                                  Icons.phone_in_talk,
                                  color: AppColors.mainColor,
                                  size: AppDimensions.font32,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppDimensions.spacing20),
              child: Text(
                'This reponse is generated based on your current location ',
                style: CustomTextStyles.primaryTextStyle
                    .copyWith(fontSize: AppDimensions.font18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCustomDialogue(emergencyName, emergencyContact) {
    Timer(
      const Duration(seconds: 2),
      () {
        Get.dialog(
          AlertDialog(
            title: const Text("Get Feedback"),
            content: const Text(
              "Did you interract with the contact? \nWould you like give a review?",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back(result: true);
                },
                child: const Text("Yes"),
              ),
              TextButton(
                onPressed: () {
                  Get.back(result: false);
                },
                child: const Text("No"),
              ),
            ],
          ),
        ).then(
          (value) {
            if (value == true) {
              Get.toNamed(
                AppRoutes.sendFeedback,
                arguments: {
                  'emergencyName': emergencyName,
                  'emergencyContact': emergencyContact,
                },
              );
            } else if (value == false) {}
          },
        );
      },
    );
  }
}
