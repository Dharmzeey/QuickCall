import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final dynamic routeTo;
  const ActionButton({super.key, required this.text, required this.routeTo});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        Get.toNamed(routeTo);
      },
      style: FilledButton.styleFrom(
          backgroundColor: AppColors.buttonColor,
          padding: EdgeInsets.all(AppDimensions.paddingSmall),
          minimumSize: Size(
              AppDimensions.screenWidth / 2, AppDimensions.screenHeight / 30)),
      child: Text(
        text,
        style: TextStyle(
            fontSize: AppDimensions.font20, fontWeight: FontWeight.w400),
      ),
    );
  }
}
