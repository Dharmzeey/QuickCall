import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/screens/login_screen.dart';
import 'package:quickcall/screens/first_signup_screen.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';

class AccountCreatedOrNot extends StatelessWidget {
  final String statusQuery;
  final String authQuery;
  final dynamic routeTo;
  const AccountCreatedOrNot(
      {super.key,
      required this.statusQuery,
      required this.authQuery,
      required this.routeTo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          statusQuery,
          style: TextStyle(
            color: AppColors.secondaryColor,
            fontSize: AppDimensions.font18,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        TextButton(
          onPressed: () {
            Get.toNamed(routeTo);
          },
          child: Text(
            authQuery,
            style: TextStyle(
                color: AppColors.mainColor,
                fontWeight: FontWeight.w400,
                fontSize: AppDimensions.font18,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
