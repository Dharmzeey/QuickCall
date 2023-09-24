import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/api/authentication.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/utils/styles.dart';
import 'package:quickcall/widgets/auth_type_divide_widget.dart';
import 'package:quickcall/widgets/google_auth_widget.dart';
import 'package:quickcall/widgets/button_widgets.dart';
import 'package:quickcall/widgets/text_input_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _username;
  late final TextEditingController _password;
  bool isEnabled = false;
  bool isProcessing = false;

  void checkFieldValue(String username, String password) {
    if (username.length > 3 && password.length > 5) {
      setState(() {
        isEnabled = true;
      });
    } else {
      setState(() {
        isEnabled = false;
      });
    }
  }

  void _setAnonymousStatus() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isActivated', true);
    pref.setBool('isAnonymous', true);
    Get.offAndToNamed(AppRoutes.welcome);
  }

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _password = TextEditingController();
    _username.addListener(() {
      checkFieldValue(_username.text, _password.text);
    });
    _password.addListener(() {
      checkFieldValue(_username.text, _password.text);
    });
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMain),
          child: Form(
            key: _formKey,
            child: Column(
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
                      fontSize: AppDimensions.font24,
                      color: AppColors.mainColor),
                ),
                SizedBox(
                  height: AppDimensions.spacing20,
                ),
                InfoTextInputWidget(
                  label: "Username",
                  inputController: _username,
                ),
                SizedBox(height: AppDimensions.spacing30),
                InfoTextInputWidget(
                  label: "Password",
                  inputController: _password,
                ),
                SizedBox(height: AppDimensions.spacing50),
                const AuthTypeDivider(),
                SizedBox(height: AppDimensions.spacing50),
                const GoogleAuthWidget(label: "Continue with Google"),
                SizedBox(height: AppDimensions.spacing20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account ?",
                      style: CustomTextStyles.primaryTextStyle,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.signIn);
                      },
                      child: Text(
                        'Login',
                        style: CustomTextStyles.primaryTextStyle.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.mainColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppDimensions.spacing200,
                ),
                ActionButton(
                  text: 'Skip for Now',
                  isEnabled: true,
                  isProcessing: false,
                  onPressedFunction: _setAnonymousStatus,
                ),
                SizedBox(
                  height: AppDimensions.spacing10,
                ),
                ActionButton(
                  text: "Next",
                  isEnabled: isEnabled,
                  isProcessing: isProcessing,
                  onPressedFunction: createUser,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> createUser() async {
    setState(() {
      isProcessing = true;
      isEnabled = false;
    });
    final bool signUpResponse =
        await Authentication().signUp(_username, _password);
    if (signUpResponse) {
      Get.offAndToNamed(AppRoutes.signIn);
    } else {}
    setState(() {
      isProcessing = false;
      isEnabled = true;
    });
  }
}
