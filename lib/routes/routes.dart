import 'package:get/get.dart';
import 'package:quickcall/screens/allow_location_screen.dart';
import 'package:quickcall/screens/emergency_contact_screen.dart';
import 'package:quickcall/screens/emergency_info_screen.dart';
import 'package:quickcall/screens/emergency_tips.dart';
import 'package:quickcall/screens/login_screen.dart';
import 'package:quickcall/screens/medical_information_screen.dart';
import 'package:quickcall/screens/onboarding_screen.dart';
import 'package:quickcall/screens/personal_information_screen.dart';
import 'package:quickcall/screens/proximal_emergency_places.dart';
import 'package:quickcall/screens/signup_screen.dart';
import 'package:quickcall/screens/welcome_screen.dart';

class AppRoutes {
  static const String initial = "/";
  static const String login = "/login";
  static const String signup = "/signup";
  static const String allowLocation = "/allow-location";
  static const String personalInformation = "/personal-information";
  static const String medicalInformation = "/medical-information";
  static const String welcome = "/welcome";
  static const String emergencyInfo = "/emergency-info";
  static const String proximalEmergencyPlaces = "/proximal-emergency-places";
  static const String emergencyContact = "/emergency-contact";
  static const String emergencyTips = "/emergency-tips";

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const OnBoarding()),
    GetPage(name: login, page: () => const Login()),
    GetPage(name: signup, page: () => const SignUp()),
    GetPage(name: allowLocation, page: () => const AllowLocation()),
    GetPage(name: personalInformation, page: () => const PersonalInformation()),
    GetPage(name: medicalInformation, page: () => const MedicalInformation()),
    GetPage(name: welcome, page: () => WelcomeScreen()),
    GetPage(name: emergencyInfo, page: () => const EmergencyInformation()),
    GetPage(name: proximalEmergencyPlaces, page: () => const ProximalEmergencyPlaces()),
    GetPage(name: emergencyContact, page: () => EmergencyContact()),
    GetPage(name: emergencyTips, page: () => const EmergencyTips()),
  ];
}
