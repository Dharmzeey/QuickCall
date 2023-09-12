import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/utils/dimension.dart';

class EmergencyWidget extends StatelessWidget {
  const EmergencyWidget(
      {super.key, required this.text, required this.routeTo, required this.bgColor, required this.imageUrl});
  final String text;
  final Color bgColor;
  final String imageUrl;
  final dynamic routeTo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppDimensions.spacing20),
      child: Row(
        children: [
          Image(image: AssetImage(imageUrl)),
          SizedBox(
            width: AppDimensions.spacing20,
          ),
          FilledButton(
            onPressed: () {
              Get.toNamed(routeTo);
            },
            style: FilledButton.styleFrom(
                backgroundColor: bgColor,
                padding: EdgeInsets.all(AppDimensions.paddingSmall),
                minimumSize: Size(AppDimensions.screenWidth / 1.5,
                    AppDimensions.screenHeight / 30)),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: AppDimensions.font20, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
