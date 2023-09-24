// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

Temperatures temperaturesFromJson(String str) =>
    Temperatures.fromJson(json.decode(str));

String temperaturesToJson(Temperatures data) => json.encode(data.toJson());

class Temperatures {
  String status;
  List<Feedback> feedbacks;

  Temperatures({
    required this.status,
    required this.feedbacks,
  });

  factory Temperatures.fromJson(Map<String, dynamic> json) => Temperatures(
        status: json["status"],
        feedbacks: List<Feedback>.from(
            json["feedbacks"].map((x) => Feedback.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "feedbacks": List<dynamic>.from(feedbacks.map((x) => x.toJson())),
      };
}

class Feedback {
  String feedbackId;
  String username;
  String emergencyType;
  String comment;
  String emergencyContact;
  String location;
  int rating;
  DateTime createdAt;
  DateTime updatedAt;
  String userId;

  Feedback({
    required this.feedbackId,
    required this.username,
    required this.emergencyType,
    required this.comment,
    required this.emergencyContact,
    required this.location,
    required this.rating,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });

  factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
        feedbackId: json["feedbackId"],
        username: json["username"],
        emergencyType: json["emergencyType"],
        comment: json["comment"],
        emergencyContact: json["emergencyContact"],
        location: json["location"],
        rating: json["rating"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "feedbackId": feedbackId,
        "username": username,
        "emergencyType": emergencyType,
        "comment": comment,
        "emergencyContact": emergencyContact,
        "location": location,
        "rating": rating,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "userId": userId,
      };
}
