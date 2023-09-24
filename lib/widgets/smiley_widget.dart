import 'package:flutter/material.dart';
import 'package:quickcall/utils/styles.dart';

class SmileyWidget extends StatelessWidget {
  const SmileyWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor,
      required this.size});

  final IconData icon;
  final String text;
  final Color iconColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: size,
          color: iconColor,
        ),
        Text(
          text,
          style: CustomTextStyles.primaryTextStyle,
        ),
      ],
    );
  }
}
