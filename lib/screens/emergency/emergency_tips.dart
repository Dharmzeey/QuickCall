import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/utils/styles.dart';

class EmergencyTips extends StatelessWidget {
  const EmergencyTips({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = Get.arguments;
    final String title = arguments['title'];
    final tips = List<dynamic>.from(arguments['tips']);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: AppColors.mainColor),
        ),
        iconTheme: const IconThemeData(color: AppColors.mainColor),
        backgroundColor: AppColors.bgColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingMain),
        child: Center(
            child: ListView.builder(
          itemCount: tips.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                tips[index].description,
                style: CustomTextStyles.primaryTextStyle,
              ),
            );
          },
        )),
      ),
    );
  }
}
