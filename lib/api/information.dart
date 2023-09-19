import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
  Future<bool> submitPersonalInfo(
    TextEditingController firstName,
    TextEditingController lastName,
    TextEditingController email,
    TextEditingController phoneNumber,
    String gender,
    TextEditingController age,
    TextEditingController emergencyContact,
    TextEditingController emergencyContactRelationship,
    TextEditingController emergencyContactNumber,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token') ?? '';
    final url = Uri.parse(AppUrls.baseUrl + AppUrls.createBasicInfo);
    final response = await http.post(
      url,
      headers: {'Authorization': token, 'Content-Type': 'application/json'},
      body: jsonEncode({
        'firstName': firstName.text,
        'lastName': lastName.text,
        'email': email.text,
        'phoneNo1': phoneNumber.text,
        'gender': gender,
        'age': age.text,
        'nameOfEmerContact': emergencyContact.text,
        'relationship': emergencyContactRelationship.text,
        'emergencyPhoneNo': emergencyContactNumber.text,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print('Data submitted successfully: $responseData');
      Get.snackbar('Success', 'Personal Information saved',colorText: AppColors.mainColor);
      return true;
    } else {
      print('Error submitting data: ${response.statusCode}');
      print('Response body: ${response.body}');
      Get.snackbar('Error', 'An Error Occured',colorText: AppColors.mainColor);
      return false;
    }
  }

  Future<bool> submitMedicalInfo(
    TextEditingController bloodGroup,
    TextEditingController genotype,
    TextEditingController allergies,
    TextEditingController otherConditions,
    TextEditingController familyDoctorContact,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token') ?? '';
    final url = Uri.parse(AppUrls.baseUrl + AppUrls.submitMedicalInfo);
    final response = await http.post(
      url,
      headers: {'Authorization': token, 'Content-Type': 'application/json'},
      body: jsonEncode({
        'bloodType': bloodGroup.text,
        'genotype': genotype.text,
        'allergies': allergies.text,
        'chronicConditions': otherConditions.text,
        'famDocContact': familyDoctorContact.text,
      }),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print('Data submitted successfully: $responseData');
      Get.snackbar('Success', 'Personal Information saved',colorText: AppColors.mainColor);
      return true;
    } else {
      
      print('Error submitting data: ${response.statusCode}');
      print('Response body: ${response.body}');
      Get.snackbar('Error', 'An Error Occured',colorText: AppColors.mainColor);
      return false;
    }
  }
}
