import 'package:flutter/material.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';

class AuthTypeDivider extends StatelessWidget {
  const AuthTypeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '-' * AppDimensions.divideBy14.toInt(),
          style: const TextStyle(
            color: AppColors.mainColor,
          ),
        ),
        const Text(" Or ",
            style: TextStyle(
              color: AppColors.mainColor,
            )),
        Text(
          '-' * AppDimensions.divideBy14.toInt(),
          style: const TextStyle(
            color: AppColors.mainColor,
          ),
        )
      ],
    );
  }
}
