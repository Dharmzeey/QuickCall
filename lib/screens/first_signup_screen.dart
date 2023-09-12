import 'package:flutter/material.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/widgets/account_created_or_not_widget.dart';
import 'package:quickcall/widgets/auth_type_divide_widget.dart';
import 'package:quickcall/widgets/google_auth_widget.dart';
import 'package:quickcall/widgets/button_widgets.dart';
import 'package:quickcall/widgets/text_input_widget.dart';

class FirstSignUp extends StatelessWidget {
  const FirstSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingMain),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: AppDimensions.spacing150,
            ),
            Text(
              "SIGN UP",
              style: TextStyle(
                  fontSize: AppDimensions.font32,
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: AppDimensions.spacing100,
            ),
            const GoogleAuthWidget(
              label: "Sign up with Google",
            ),
            SizedBox(
              height: AppDimensions.spacing50,
            ),
            const AuthTypeDivider(),
            SizedBox(
              height: AppDimensions.spacing50,
            ),
            const Row(
              children: [
                Expanded(
                  child: SignUpTextInputWidget(
                    label: "First Name",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SignUpTextInputWidget(
                    label: "Last Name",
                  ),
                )
              ],
            ),
            SizedBox(height: AppDimensions.spacing20),
            const SignUpTextInputWidget(label: "Email"),
            SizedBox(height: AppDimensions.spacing20),
            const SignUpTextInputWidget(label: "Password"),
            SizedBox(height: AppDimensions.spacing20),
            const ActionButton(
              text: "Create Account",
              routeTo: AppRoutes.signup,
            ),
            SizedBox(
              height: AppDimensions.spacing150,
            ),
            const AccountCreatedOrNot(
              statusQuery: "Have an account already?",
              authQuery: "Login",
              routeTo: AppRoutes.login,
            )
          ],
        ),
      ),
    );
  }
}
