import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quickcall/controller/location_controller.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/utils/launchers.dart';

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
              padding: const EdgeInsets.all(10),
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
                        width: AppDimensions.spacing20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(officials[index][0]),
                          SizedBox(height: AppDimensions.spacing10),
                          Row(
                            children: [
                              Text(officials[index][1]),
                              const Text(" , "),
                              Text(officials[index][2])
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            openWhatsAppChat(officials[index][3]);
                          },
                          icon: const FaIcon(FontAwesomeIcons.whatsapp)),
                      IconButton(
                          onPressed: () {},
                          icon: const FaIcon(FontAwesomeIcons.comment)),
                      IconButton(
                          onPressed: () {
                            openPhoneDialer(officials[index][4]);
                          },
                          icon: const Icon(Icons.call_outlined))
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
