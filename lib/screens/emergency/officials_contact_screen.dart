import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quickcall/controller/location_controller.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/utils/launchers.dart';
import 'package:quickcall/utils/styles.dart';

class OfficialsContact extends StatelessWidget {
  OfficialsContact({super.key});
  final LocationController locationController = Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    final dynamic arguments = Get.arguments;
    const String title = "Officials you can contact";
    final officials = List<dynamic>.from(arguments['officials']);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          title,
          style: TextStyle(color: AppColors.mainColor),
        ),
        iconTheme: const IconThemeData(color: AppColors.mainColor),
        backgroundColor: AppColors.bgColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingMain),
        child: ListView.builder(
          itemCount: officials.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: AppDimensions.spacing10),
              padding: EdgeInsets.all(AppDimensions.paddingSmall),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: AppDimensions.size40,
                      ),
                      SizedBox(
                        width: AppDimensions.spacing10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            officials[index].position,
                          ),
                          SizedBox(height: AppDimensions.spacing5),
                          Text(officials[index].personName),
                          SizedBox(height: AppDimensions.spacing5),
                          Row(
                            children: [
                              Text(
                                officials[index].phoneNo,
                                style: CustomTextStyles.primaryTextStyle
                                    .copyWith(color: AppColors.bgColor),
                              ),
                              const Text(" , "),
                              Text(
                                officials[index].whatsappContact,
                                style: CustomTextStyles.primaryTextStyle
                                    .copyWith(color: AppColors.bgColor),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: AppDimensions.spacing50,
                        child: IconButton(
                            onPressed: () {
                              openWhatsAppChat(
                                  officials[index].whatsappContact);
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.whatsapp,
                              size: AppDimensions.font32,
                            )),
                      ),
                      SizedBox(
                        width: AppDimensions.spacing50,
                        child: IconButton(
                            onPressed: () {
                              const bodyMessage = 'Quick Call ...';
                              openSMS(officials[index].whatsappContact,
                                  bodyMessage);
                            },
                            icon: Icon(
                              Icons.message,
                              size: AppDimensions.font32,
                            )),
                      ),
                      SizedBox(
                        width: AppDimensions.spacing40,
                        child: IconButton(
                            onPressed: () {
                              openPhoneDialer(officials[index].phoneNo);
                            },
                            icon: Icon(
                              Icons.call_outlined,
                              size: AppDimensions.font32,
                            )),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
