import 'package:flutter/material.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';

class AccountCreatedOrNot extends StatelessWidget {
  final String statusQuery;
  final String authQuery;
  const AccountCreatedOrNot(
      {super.key, required this.statusQuery, required this.authQuery});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          statusQuery,
          style: TextStyle(
            color: const Color.fromRGBO(108, 9, 9, 0.6),
            fontSize: AppDimensions.font18,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          authQuery,
          style: TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.w400,
              fontSize: AppDimensions.font18,
              decoration: TextDecoration.underline),
        ),
      ],
    );
  }
}
