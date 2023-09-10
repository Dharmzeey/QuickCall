import 'package:flutter/material.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';

class LoginSignupButton extends StatelessWidget {
  final String text;
  const LoginSignupButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: FilledButton.styleFrom(
          backgroundColor: AppColors.secondaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
