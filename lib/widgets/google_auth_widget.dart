import 'package:flutter/material.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';

class GoogleAuthWidget extends StatelessWidget {
  final String label;
  const GoogleAuthWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingSmall),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.mainColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage('images/icon-google.png'),
            width: AppDimensions.font24,
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
                color: AppColors.mainColor,
                fontSize: AppDimensions.font20,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
