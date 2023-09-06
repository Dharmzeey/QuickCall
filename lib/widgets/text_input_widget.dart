import 'package:flutter/material.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';

class SignUpTextInputWidget extends StatelessWidget {
  final String label;
  const SignUpTextInputWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.mainColor, width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          label: Text(label),
          labelStyle: TextStyle(
              color: AppColors.mainColor,
              fontSize: AppDimensions.font20,
              fontWeight: FontWeight.w400),
          border: const OutlineInputBorder()),
    );
  }
}

class LoginTextInputWidget extends StatelessWidget {
  final String label;
  final Icon iconType;
  const LoginTextInputWidget(
      {super.key, required this.label, required this.iconType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.mainColor, width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          label: Text(label),
          labelStyle: TextStyle(
              color: AppColors.mainColor,
              fontSize: AppDimensions.font20,
              fontWeight: FontWeight.w400),
          border: const OutlineInputBorder(),
          prefixIcon: iconType,
          iconColor: AppColors.mainColor,),
    );
  }
}
