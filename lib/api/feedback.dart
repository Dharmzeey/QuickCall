import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quickcall/models/feedback_model.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedBackApi {
  Future<bool> sendFeedback(
    String location,
    String comment,
    String emergencyType,
    String emergencyContact,
    int rating,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token') ?? '';
    final url = Uri.parse(AppUrls.baseUrl + AppUrls.sendFeedback);
    final response = await http.post(
      url,
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          'location': location,
          'comment': comment,
          'emergencyType': emergencyType,
          'emergencyContact': emergencyContact,
          'rating': "$rating",
        },
      ),
    );

    if (response.statusCode == 201) {
      Get.snackbar(
        'Success',
        'Feedback sent sucesfully',
        colorText: AppColors.mainColor,
      );
      return true;
    } else {
      Get.snackbar(
        'Error',
        response.body,
        colorText: AppColors.mainColor,
      );
      return false;
    }
  }

  Future<dynamic> fetchFeedbacks() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token') ?? '';
    final url = Uri.parse(AppUrls.baseUrl + AppUrls.fetchFeedbacks);
    final feedbacks = <Feedback>[];
    final response = await http.get(
      url,
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<Feedback> fetchFeedback = jsonData['feedbacks']
          ?.map((json) => Feedback.fromJson(json))
          .toList()
          .cast<Feedback>();
      feedbacks.assignAll(fetchFeedback);
      return feedbacks;
    }
  }
}


