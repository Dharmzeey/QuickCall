import 'package:flutter/material.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/widgets/account_created_or_not_widget.dart';
import 'package:quickcall/widgets/auth_type_divide_widget.dart';
import 'package:quickcall/widgets/google_auth_widget.dart';
import 'package:quickcall/widgets/button_widgets.dart';
import 'package:quickcall/widgets/text_input_widget.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
              height: AppDimensions.spacing200,
            ),
            Container(
              height: AppDimensions.height120,
              width: AppDimensions.height120,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/loggingin.png"),
                      fit: BoxFit.contain)),
            ),
            SizedBox(
              height: AppDimensions.spacing20,
            ),
            Text(
              "SIGN UP",
              style: TextStyle(
                  fontSize: AppDimensions.font24, color: AppColors.mainColor),
            ),
            SizedBox(
              height: AppDimensions.spacing20,
            ),
            const SignUpTextInputWidget(label: "Username"),
            SizedBox(height: AppDimensions.spacing30),
            const SignUpTextInputWidget(label: "Password"),
            SizedBox(height: AppDimensions.spacing50),
            const AuthTypeDivider(),
            SizedBox(height: AppDimensions.spacing50),
            const GoogleAuthWidget(label: "Continue with Google"),
            SizedBox(
              height: AppDimensions.spacing250,
            ),
            const ActionButton(text: "Next", routeTo: AppRoutes.allowLocation)
          ],
        ),
      ),
    );
  }
}
