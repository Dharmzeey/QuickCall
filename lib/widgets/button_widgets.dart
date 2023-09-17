import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.text,
    required this.routeTo,
    required this.isEnabled,
    this.onPressedFunction,
    required this.isProcessing,
  });
  final String text;
  final dynamic routeTo;
  final bool isEnabled;
  final dynamic onPressedFunction;
  final bool isProcessing;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () async {
        if (isEnabled) {
          if (onPressedFunction != null) {
            await onPressedFunction();
          }
        } else {}
        isEnabled ? Get.toNamed(routeTo) : null;
      },
      style: FilledButton.styleFrom(
        backgroundColor:
            isEnabled ? AppColors.buttonColor : AppColors.disabledButtonColor,
        padding: EdgeInsets.all(AppDimensions.paddingSmall),
        minimumSize: Size(
            AppDimensions.screenWidth / 2, AppDimensions.screenHeight / 30),
      ),
      child: isProcessing
          ? const CircularProgressIndicator()
          : Text(
              text,
              style: TextStyle(
                  fontSize: AppDimensions.font20,
                  fontWeight: FontWeight.w400,
                  color: isEnabled
                      ? AppColors.mainColor
                      : AppColors.disabledTextColor),
            ),
    );
  }
}


