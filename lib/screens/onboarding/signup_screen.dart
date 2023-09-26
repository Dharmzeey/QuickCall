import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/api/authentication.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/utils/styles.dart';
// import 'package:quickcall/widgets/auth_type_divide_widget.dart';
// import 'package:quickcall/widgets/google_auth_widget.dart';
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
  late final TextEditingController _password2;
  bool isEnabled = false;
  bool isProcessing = false;

  bool _obscureText1 = true;
  bool _obscureText2 = true;

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
    _password2 = TextEditingController();
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
    _password2.dispose();
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
                        image: AssetImage("images/signingup.png"),
                        fit: BoxFit.contain),
                  ),
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
                // PasswordInputWidget(
                //   label: "Password",
                //   inputController: _password,
                // ),
                TextFormField(
                  style: const TextStyle(color: AppColors.mainColor),
                  controller: _password,
                  obscureText: _obscureText1,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.mainColor, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingSmall),
                    label: const Text("Password"),
                    labelStyle: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: AppDimensions.font20,
                        fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            _obscureText1 = !_obscureText1;
                          },
                        );
                      },
                      icon: Icon(_obscureText1
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.spacing30),
                TextFormField(
                  style: const TextStyle(color: AppColors.mainColor),
                  controller: _password2,
                  obscureText: _obscureText2,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.mainColor, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingSmall),
                    label: const Text("Confirm Password"),
                    labelStyle: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: AppDimensions.font20,
                        fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            _obscureText2 = !_obscureText2;
                          },
                        );
                      },
                      icon: Icon(_obscureText2
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                ),
                // SizedBox(height: AppDimensions.spacing50),
                // const AuthTypeDivider(),
                // SizedBox(height: AppDimensions.spacing50),
                // const GoogleAuthWidget(label: "Continue with Google"),
                SizedBox(height: AppDimensions.spacing20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ?",
                      style: CustomTextStyles.primaryTextStyle,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offAndToNamed(AppRoutes.signIn);
                      },
                      child: Text(
                        'Sign In',
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
    if (_password.text.length < 5) {
      Get.snackbar('Message', 'Password too short',
          colorText: AppColors.mainColor);
    } else if (_password.text != _password2.text) {
      Get.snackbar('Message', 'Password does not match',
          colorText: AppColors.mainColor);
    } else {
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
}
