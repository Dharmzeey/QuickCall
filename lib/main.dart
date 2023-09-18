import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/api/user_status_api.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/screens/welcome_screen.dart';
import 'package:quickcall/utils/colors.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Future<bool> activationStatus = DeviceActivated().getActivationStatus();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Inria Sans',
        scaffoldBackgroundColor: AppColors.bgColor,

      ),
      debugShowCheckedModeBanner: false,
      // home: FutureBuilder(
      //   future: activationStatus,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const CircularProgressIndicator();
      //     } else if (snapshot.hasError) {
      //       return Center(child: Text('Error: ${snapshot.error}'));
      //     } else {
      //       final bool isActivated = snapshot.data!;
      //       return isActivated ? WelcomeScreen() : const OnBoarding();
      //     }
      //   },
      // ),
      home: WelcomeScreen(),
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
    );
  }
}
