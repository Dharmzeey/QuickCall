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
    bool isUpdating,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token') ?? '';
    var url = Uri.parse(AppUrls.baseUrl + AppUrls.createBasicInfo);
    var requestType;
    if (isUpdating) {
      url = Uri.parse(AppUrls.baseUrl + AppUrls.updateBasicInfo);
      requestType = http.patch;
    } else {
      url = Uri.parse(AppUrls.baseUrl + AppUrls.updateBasicInfo);
      requestType = http.post;
    }

    final response = await requestType(
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

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      print('Data submitted successfully: $responseData');
      Get.snackbar('Success', 'Personal Information saved',
          colorText: AppColors.mainColor);
      return true;
    } else if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print('Data submitted successfully: $responseData');
      Get.snackbar('Success', 'Personal Information Updated',
          colorText: AppColors.mainColor);
      return true;
    } else {
      print(token);
      print('Error submitting data: ${response.statusCode}');
      print('Response body: ${response.body}');
      Get.snackbar('Error', 'An Error Occured', colorText: AppColors.mainColor);
      return false;
    }
  }

  Future<bool> submitMedicalInfo(
    TextEditingController bloodGroup,
    TextEditingController genotype,
    TextEditingController allergies,
    TextEditingController otherConditions,
    TextEditingController familyDoctorContact,
    bool isUpdating,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token') ?? '';
    var url = Uri.parse(AppUrls.baseUrl + AppUrls.createMedicalInfo);
    var requestType;
    if (isUpdating) {
      url = Uri.parse(AppUrls.baseUrl + AppUrls.updateMedicalInfo);
      requestType = http.patch;
    } else {
      url = Uri.parse(AppUrls.baseUrl + AppUrls.createMedicalInfo);
      requestType = http.post;
    }
    final response = await requestType(
      url,
      headers: {'Authorization': token, 'Content-Type': 'application/json'},
      body: jsonEncode({
        'bloodType': bloodGroup.text,
        'genotype': genotype.text,
        'allergies': allergies.text.split(','),
        'chronicConditions': otherConditions.text.split(','),
        'famDocContact': familyDoctorContact.text,
      }),
    );
    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      print('Data submitted successfully: $responseData');
      Get.snackbar('Success', 'Medical Information saved',
          colorText: AppColors.mainColor);
      return true;
    } else if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print('Medical Info updtaed successfully: $responseData');
      Get.snackbar('Success', 'Medical Information Updated',
          colorText: AppColors.mainColor);
      return true;
    } else {
      print('Error submitting data: ${response.statusCode}');
      print('Response body: ${response.body}');
      Get.snackbar('Error', 'An Error Occured', colorText: AppColors.mainColor);
      return false;
    }
  }

  Future<dynamic> fetchBasicInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token') ?? '';
    final url = Uri.parse(AppUrls.baseUrl + AppUrls.getBasicInfo);
    final response = await http.get(url, headers: {'Authorization': token});

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return jsonData;
    } else {
      print('Error fetching In: ${response.statusCode}');
      print('Response body for fetching ${response.body}');

      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> fetchMedicalInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token') ?? '';
    final url = Uri.parse(AppUrls.baseUrl + AppUrls.getMedicalInfo);
    final response = await http.get(url, headers: {'Authorization': token});

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return jsonData;
    } else {
      print('Error fetching In: ${response.statusCode}');
      print('Response body for fetching ${response.body}');

      throw Exception('Failed to load data');
    }
  }
}
