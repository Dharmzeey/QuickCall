import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/styles.dart';

class ProximalEmergencyPlaces extends StatelessWidget {
  const ProximalEmergencyPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = Get.arguments;
    final String title = arguments['title'];
    final number = List<String>.from(arguments['number']);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: AppColors.mainColor),
        ),
        iconTheme: const IconThemeData(color: AppColors.mainColor),
        backgroundColor: AppColors.bgColor,
      ),
      body: ListView.builder(
        itemCount: number.length,
        itemBuilder: (context, index) {
          return ListTile(
            title:
                Text(number[index], style: CustomTextStyles.primaryTextStyle),
          );
        },
      ),
    );
  }
}
