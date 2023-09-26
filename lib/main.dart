import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/api/user_status_api.dart';
import 'package:quickcall/controller/user_controller.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/screens/onboarding/signin_screen.dart';
import 'package:quickcall/screens/onboarding/onboarding_screen.dart';
import 'package:quickcall/screens/emergency/welcome_screen.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Future<bool> activationStatus = DeviceActivated().getActivationStatus();

  Future<Widget> loadHomePage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isActivated = prefs.getBool("isActivated") ?? false;
    final bool isAnonymous = prefs.getBool("isAnonymous") ?? false;

    if (!isActivated) {
      return const OnBoarding();
    } else if (isActivated && isAnonymous) {
      return WelcomeScreen();
    } else if (isActivated && !isAnonymous) {
      try {
        Get.put<UserProfileController>(UserProfileController());
        return WelcomeScreen();
      } catch (e) {
        return const SignIn();
      }
    }
    return const OnBoarding();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Inria Sans',
        scaffoldBackgroundColor: AppColors.bgColor,
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: loadHomePage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final Widget widgetType = snapshot.data!;
            return widgetType;
          }
        },
      ),
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
    );
  }
}
