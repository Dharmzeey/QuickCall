import 'package:get/get.dart';
import 'package:quickcall/screens/home_screen.dart';
import 'package:quickcall/screens/login_screen.dart';
import 'package:quickcall/screens/signup_screen.dart';

class AppRoutes {
  static const String initial = "/";
  static const String login = "/login";
  static const String signup = "/signup";

  static List<GetPage> routes = [
    GetPage(name: "/", page: () => const Login()),
    GetPage(name: login, page: () => const Login()),
    GetPage(name: signup, page: () => const SignUp()),
  ];
}
