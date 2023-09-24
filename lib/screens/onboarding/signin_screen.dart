import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/api/authentication.dart';
import 'package:quickcall/controller/user_controller.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/utils/styles.dart';
import 'package:quickcall/widgets/auth_type_divide_widget.dart';
import 'package:quickcall/widgets/google_auth_widget.dart';
import 'package:quickcall/widgets/button_widgets.dart';
import 'package:quickcall/widgets/text_input_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _username;
  late final TextEditingController _password;
  bool isEnabled = false;
  bool isProcessing = false;
  final displayNameController = Get.put(DisplayDetailsController());

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
                        image: AssetImage("images/signin.png"),
                        fit: BoxFit.contain),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.spacing20,
                ),
                Text(
                  "SIGN IN",
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
                  isTextObscured: true,
                ),
                SizedBox(height: AppDimensions.spacing50),
                const AuthTypeDivider(),
                SizedBox(height: AppDimensions.spacing50),
                const GoogleAuthWidget(label: "Continue with Google"),
                SizedBox(height: AppDimensions.spacing20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    "Don't have an account ?",
                    style: CustomTextStyles.primaryTextStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAndToNamed(AppRoutes.signUp);
                    },
                    child: Text(
                      'SignUp',
                      style: CustomTextStyles.primaryTextStyle.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.mainColor),
                    ),
                  ),
                ]),
                SizedBox(
                  height: AppDimensions.spacing350,
                ),
                ActionButton(
                  text: "Next",
                  isEnabled: isEnabled,
                  isProcessing: false,
                  onPressedFunction: signInUser,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInUser() async {
    setState(() {
      isProcessing = true;
      isEnabled = false;
    });
    final dynamic signInResponse =
        await Authentication().signIn(_username, _password);
    if (signInResponse != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isActivated", true);

      if (signInResponse['status'] == 'success') {
        displayNameController.isLoggedIn.value = true;
        if (signInResponse['profileFilled'] &&
            signInResponse['medInfo'] != null) {
          displayNameController.displayName.value =
              signInResponse['user']['firstName'];
          Get.offAndToNamed(AppRoutes.welcome);
        } else if (signInResponse['profileFilled']) {
          displayNameController.displayName.value =
              signInResponse['user']['firstName'];
          Get.offAndToNamed(AppRoutes.medicalInformation);
        } else {
          displayNameController.displayName.value = "User";
          Get.offAndToNamed(AppRoutes.personalInformation);
        }
      } else {}
      setState(() {
        isProcessing = false;
        isEnabled = true;
      });
    }
  }
}
