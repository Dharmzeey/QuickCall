import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quickcall/controller/emergency_info_controller.dart';
import 'package:quickcall/controller/location_controller.dart';
import 'package:quickcall/controller/user_controller.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/screens/onboarding/medical_information_screen.dart';
import 'package:quickcall/screens/onboarding/personal_information_screen.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/widgets/emergency_widget.dart';
import 'package:quickcall/widgets/layouts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  final LocationController locationController = Get.put(LocationController());
  final DisplayDetailsController displayDetailsController =
      Get.put(DisplayDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.mainColor,
          size: AppDimensions.font32,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: locationController.hasPermission
              ? [
                  const Icon(
                    Icons.location_on_outlined,
                    color: AppColors.mainColor,
                  ),
                  Obx(
                    () => Text(
                      locationController.localGovernment.value,
                      style: TextStyle(
                        fontSize: AppDimensions.font18,
                        color: AppColors.mainColor,
                      ),
                    ),
                  )
                ]
              : [
                  const Icon(
                    Icons.location_off_outlined,
                    color: AppColors.mainColor,
                  ),
                  Text(
                    'Location Service Unavailable',
                    style: TextStyle(
                        fontSize: AppDimensions.font18,
                        color: AppColors.mainColor),
                  )
                ],
        ),
        backgroundColor: AppColors.bgColor,
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMain),
        child: Column(
          children: [
            SizedBox(
              height: AppDimensions.spacing100,
            ),
            Obx(
              () => CircleAvatar(
                radius: 100,
                child: displayDetailsController.displayGender.value == "Female"
                    ? const Image(image: AssetImage("images/avatar_female.png"))
                    : const Image(
                        image: AssetImage("images/avatar_male.png"),
                      ),
              ),
            ),
            SizedBox(
              height: AppDimensions.spacing20,
            ),
            Obx(
              () => Text(
                displayDetailsController.displayName.value,
                style: TextStyle(
                    color: AppColors.mainColor, fontSize: AppDimensions.font24),
              ),
            ),
            SizedBox(
              height: AppDimensions.spacing150,
            ),
            Text(
              "WHAT IS YOUR EMERGENCY??",
              style: TextStyle(
                  fontSize: AppDimensions.font24, color: AppColors.mainColor),
            ),
            SizedBox(
              height: AppDimensions.spacing50,
            ),
            EmergencyTypeWidget(
              imageUrl: "images/police.png",
              text: "POLICE",
              bgColor: const Color.fromRGBO(55, 55, 55, 1),
              args: {
                'emergencyType': 'Police Emergency',
                'helpNearYou': 'Police Stations near you',
                'helpNearYouIcon': const FaIcon(
                  FontAwesomeIcons.building,
                  color: AppColors.iconMainColor,
                ),
                'emergencyLines': 'Police Emergency lines in your location',
                'emergencyLinesIcon': const Icon(
                  Icons.phonelink_ring_sharp,
                  color: AppColors.iconMainColor,
                ),
                'emergencyTip': 'Things you can do during police emergency',
                'emergencyTipIcon': const Icon(
                  Icons.dangerous,
                  color: AppColors.iconMainColor,
                ),
                'emergencyIcon': 'images/police_device.png',
                'controller': Get.find<EmergencyController>(tag: 'Police'),
              },
            ),
            SizedBox(
              height: AppDimensions.spacing30,
            ),
            EmergencyTypeWidget(
                imageUrl: "images/medics.png",
                text: "MEDICAL",
                bgColor: const Color.fromRGBO(0, 56, 254, 1),
                args: {
                  'emergencyType': 'Medical Emergency',
                  'helpNearYou': 'Hospitals / Medical centers near you',
                  'helpNearYouIcon': const FaIcon(
                    FontAwesomeIcons.truckMedical,
                    color: AppColors.iconMainColor,
                  ),
                  'emergencyLines': 'Medical Emergency lines in your location',
                  'emergencyLinesIcon': const Icon(
                    Icons.phonelink_ring_sharp,
                    color: AppColors.iconMainColor,
                  ),
                  'emergencyTip': 'First aid tips for emergency situations',
                  'emergencyTipIcon': const FaIcon(
                    FontAwesomeIcons.kitMedical,
                    color: AppColors.iconMainColor,
                  ),
                  'emergencyIcon': 'images/medical_insurance.png',
                  'controller': Get.find<EmergencyController>(tag: 'Medical'),
                }),
            SizedBox(
              height: AppDimensions.spacing30,
            ),
            EmergencyTypeWidget(
              imageUrl: "images/fire.png",
              text: "FIRE",
              bgColor: const Color.fromRGBO(254, 0, 0, 1),
              args: {
                'emergencyType': 'Fire Emergency',
                'helpNearYou': 'Fire Stations near you',
                'helpNearYouIcon': const FaIcon(
                  FontAwesomeIcons.truckFieldUn,
                  color: AppColors.iconMainColor,
                ),
                'emergencyLines': 'Fire Emergency lines in your location',
                'emergencyLinesIcon': const Icon(
                  Icons.phonelink_ring_sharp,
                  color: AppColors.iconMainColor,
                ),
                'emergencyTip': 'Tips to prevent and handle fire outbreak',
                'emergencyTipIcon': const FaIcon(
                  FontAwesomeIcons.fire,
                  color: AppColors.iconMainColor,
                ),
                'emergencyIcon': 'images/fire_extinguish.png',
                'controller': Get.find<EmergencyController>(tag: 'Fire'),
              },
            ),
            SizedBox(
              height: AppDimensions.spacing200,
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(AppRoutes.generalEmergencyTips);
              },
              child: Text(
                'General Tips for emergency situations',
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: AppDimensions.font20,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationColor: Colors.blue.shade900,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});
  final UserProfileController userProfileController =
      Get.put(UserProfileController());
  final DisplayDetailsController displayDetailsController =
      Get.put(DisplayDetailsController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.mainColor,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              child: Obx(
            () => Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  child:
                      displayDetailsController.displayGender.value == "Female"
                          ? const Image(
                              image: AssetImage("images/avatar_female.png"))
                          : const Image(
                              image: AssetImage("images/avatar_male.png"),
                            ),
                ),
                SizedBox(
                  width: AppDimensions.spacing10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Obx(
                    () => Text(
                      displayDetailsController.displayName.value,
                      style: TextStyle(
                          color: AppColors.bgColor,
                          fontSize: AppDimensions.font24),
                    ),
                  ),
                ),
              ],
            ),
          )),
          SizedBox(
            height: AppDimensions.spacing50,
          ),
          Obx(() => Column(
                children: displayDetailsController.isLoggedIn.value == true
                    ? [
                        MyListTile(
                          text: 'Personal Information',
                          icon: Icons.person,
                          onTapFunction: toPersonalInformation,
                        ),
                        const Divider(),
                        MyListTile(
                          text: 'Medical Information',
                          icon: Icons.file_open_sharp,
                          onTapFunction: toMedicalInformation,
                        ),
                        const Divider(),
                        MyListTile(
                          text: 'Feedbacks',
                          icon: Icons.feed,
                          onTapFunction: toFeedback,
                        ),
                        const Divider(),
                        MyListTile(
                          text: 'Log Out',
                          icon: Icons.logout,
                          onTapFunction: toSignOut,
                        ),
                        const Divider(),
                      ]
                    : [
                        MyListTile(
                          text: 'Sign In',
                          icon: Icons.login,
                          onTapFunction: toSignIn,
                        ),
                        const Divider(),
                      ],
              ))
        ],
      ),
    );
  }

  void toSignIn() {
    Get.offAndToNamed(AppRoutes.signIn);
  }

  Future<void> toPersonalInformation() async {
    final personalInfo =
        await UserProfileController().fetchPersonalInformation();
    if (personalInfo != null) {
      Get.to(
        PersonalInformation(
          initialData: personalInfo,
        ),
      );
    } else {
      Get.toNamed(AppRoutes.personalInformation);
    }
  }

  Future<void> toMedicalInformation() async {
    final medicalInfo = await UserProfileController().fetchmedicalInformation();
    if (medicalInfo != null) {
      Get.to(
        MedicalInformation(
          initialData: medicalInfo,
        ),
      );
    } else {
      Get.toNamed(AppRoutes.medicalInformation);
    }
  }

  void toFeedback() async {
    Get.toNamed(AppRoutes.fetchFeedbacks);
  }

  void toSignOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove("isActivated");
    prefs.remove('token');
    displayDetailsController.isLoggedIn.value = false;
    Get.snackbar(
      "Success",
      "Successfully signed out",
      colorText: AppColors.mainColor,
    );
    Get.offAllNamed(AppRoutes.signIn);
  }
}
