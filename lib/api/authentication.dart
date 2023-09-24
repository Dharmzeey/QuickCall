import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  Future<bool> signUp(TextEditingController userNameController,
      TextEditingController passwordController) async {
    final url = Uri.parse(AppUrls.baseUrl + AppUrls.signUp);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': userNameController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      print('Sign-up successful: $responseData');
      Get.snackbar('Success', 'Sign up successful',
          colorText: AppColors.mainColor);
      return true;
    } else {
      Get.snackbar('Error', response.body, colorText: AppColors.mainColor);
      print('Error signing up: ${response.statusCode}');
      print('Response body: ${response.body}');
      return false;
    }
  }

  Future<dynamic> signIn(TextEditingController userNameController,
      TextEditingController passwordController) async {
    final url = Uri.parse(AppUrls.baseUrl + AppUrls.signIn);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': userNameController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, String> headers = response.headers;
      if (headers.containsKey('authorization')) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        final String token = headers['authorization'] ?? '';
        pref.setString('token', token);
      }
      final responseData = jsonDecode(response.body);
      print(responseData);
      print('Sign In successful: $responseData');
      Get.snackbar('Success', 'Sign In successful',
          colorText: AppColors.mainColor);
      return responseData;
    } else {
      Get.snackbar('Error', response.body, colorText: AppColors.mainColor);
      print('Error signing In: ${response.statusCode}');
      print('Response body: ${response.body}');
      return false;
    }
  }
}
