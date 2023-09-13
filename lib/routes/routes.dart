import 'package:get/get.dart';
import 'package:quickcall/screens/allow_location_screen.dart';
import 'package:quickcall/screens/emergency_contact_screen.dart';
import 'package:quickcall/screens/login_screen.dart';
import 'package:quickcall/screens/medical_information_screen.dart';
import 'package:quickcall/screens/onboarding_screen.dart';
import 'package:quickcall/screens/signup_screen.dart';
import 'package:quickcall/screens/welcome_screen.dart';

class AppRoutes {
  static const String initial = "/";
  static const String login = "/login";
  static const String signup = "/signup";
  static const String allowLocation = "/allow-location";
  static const String medicalInformation = "/medical-information";
  static const String welcome = "/welcome";
  static const String emergencyContact = "/emergency-contact";

  static List<GetPage> routes = [
    GetPage(name: "/", page: () => const OnBoarding()),
    GetPage(name: login, page: () => const Login()),
    GetPage(name: signup, page: () => const SignUp()),
    GetPage(name: allowLocation, page: () => AllowLocation()),
    GetPage(name: medicalInformation, page: () => const MedicalInformation()),
    GetPage(name: welcome, page: () => WelcomeScreen()),
    GetPage(name: emergencyContact, page: () => const EmergencyContact()),
  ];
}
