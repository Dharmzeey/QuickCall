import 'package:flutter/material.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/widgets/account_created_or_not_widget.dart';
import 'package:quickcall/widgets/auth_type_divide_widget.dart';
import 'package:quickcall/widgets/google_auth_widget.dart';
import 'package:quickcall/widgets/login_signup_button.dart';
import 'package:quickcall/widgets/text_input_widget.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingMain),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: AppDimensions.spacing150,
            ),
            Text(
              "LOG IN",
              style: TextStyle(
                  fontSize: AppDimensions.font32,
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: AppDimensions.spacing100,
            ),
            const LoginTextInputWidget(
                iconType: Icon(Icons.mail), label: "Email"),
            SizedBox(
              height: AppDimensions.spacing50,
            ),
            const LoginTextInputWidget(
                iconType: Icon(Icons.key), label: "Password"),
            SizedBox(
              height: AppDimensions.spacing50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      side: const BorderSide(
                          color: AppColors.mainColor, width: 2),
                      value: false,
                      onChanged: (value) {},
                    ),
                    Text(
                      "Remember Me",
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: AppDimensions.font18,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: AppDimensions.font18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppDimensions.spacing50,
            ),
            const LoginSignupButton(text: "Log in"),
            SizedBox(
              height: AppDimensions.spacing50,
            ),
            const AuthTypeDivider(),
            SizedBox(
              height: AppDimensions.spacing50,
            ),
            SizedBox(
                width: AppDimensions.width225,
                child: const GoogleAuthWidget(label: "Continue with Google")),
            SizedBox(
              height: AppDimensions.spacing100,
            ),
            const AccountCreatedOrNot(
                statusQuery: "Don't have an account?", authQuery: "Sign up")
          ],
        ),
      ),
    );
  }
}
