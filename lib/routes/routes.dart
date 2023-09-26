import 'package:get/get.dart';
import 'package:quickcall/screens/emergency/general_emergency_tips.dart';
import 'package:quickcall/screens/feedback/fetch_feedback_screen.dart';
import 'package:quickcall/screens/feedback/send_feedback_screen.dart';
import 'package:quickcall/screens/onboarding/allow_location_screen.dart';
import 'package:quickcall/screens/emergency/emergency_info_screen.dart';
import 'package:quickcall/screens/emergency/emergency_lines.dart';
import 'package:quickcall/screens/emergency/emergency_tips.dart';
import 'package:quickcall/screens/emergency/officials_contact_screen.dart';
import 'package:quickcall/screens/onboarding/signin_screen.dart';
import 'package:quickcall/screens/onboarding/medical_information_screen.dart';
import 'package:quickcall/screens/onboarding/onboarding_screen.dart';
import 'package:quickcall/screens/onboarding/personal_information_screen.dart';
import 'package:quickcall/screens/emergency/proximal_emergency_places.dart';
import 'package:quickcall/screens/onboarding/signup_screen.dart';
import 'package:quickcall/screens/emergency/welcome_screen.dart';

class AppRoutes {
  static const String initial = "/";
  static const String signIn = "/signin";
  static const String signUp = "/signup";
  static const String allowLocation = "/allow-location";
  static const String personalInformation = "/personal-information";
  static const String medicalInformation = "/medical-information";
  static const String welcome = "/welcome";
  static const String emergencyInfo = "/emergency-info";
  static const String proximalEmergencyPlaces = "/proximal-emergency-places";
  static const String emergencyLines = "/emergency-lines";
  static const String officialsContact = "/official-contacts";
  static const String specificEmergencyTips = "/emergency-tips";
  static const String generalEmergencyTips = "/emergency-emergency-tips";
  static const String sendFeedback = "/send-feedback";
  static const String fetchFeedbacks = "/fetch-feedback";

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const OnBoarding()),
    GetPage(name: signIn, page: () => const SignIn()),
    GetPage(name: signUp, page: () => const SignUp()),
    GetPage(name: allowLocation, page: () => const AllowLocation()),
    GetPage(name: personalInformation, page: () => const PersonalInformation()),
    GetPage(name: medicalInformation, page: () => const MedicalInformation()),
    GetPage(name: welcome, page: () => WelcomeScreen()),
    GetPage(name: emergencyInfo, page: () => const EmergencyInformation()),
    GetPage(
        name: proximalEmergencyPlaces,
        page: () => const ProximalEmergencyPlaces()),
    GetPage(name: emergencyLines, page: () => const EmergencyLines()),
    GetPage(name: officialsContact, page: () => OfficialsContact()),
    GetPage(name: specificEmergencyTips, page: () => const EmergencyTips()),
    GetPage(name: generalEmergencyTips, page: () => const GeneralTips()),
    GetPage(name: sendFeedback, page: () => const FeedBack()),
    GetPage(name: fetchFeedbacks, page: () => const FetchFeedBacks()),
  ];
}
