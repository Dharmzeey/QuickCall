// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

Temperatures temperaturesFromJson(String str) => Temperatures.fromJson(json.decode(str));

String temperaturesToJson(Temperatures data) => json.encode(data.toJson());

class Temperatures {
    String status;
    User user;

    Temperatures({
        required this.status,
        required this.user,
    });

    factory Temperatures.fromJson(Map<String, dynamic> json) => Temperatures(
        status: json["status"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "user": user.toJson(),
    };
}

class User {
    String userId;
    dynamic firstName;
    dynamic lastName;
    dynamic email;
    String username;
    dynamic phoneNo1;
    dynamic phoneNo2;
    dynamic age;
    dynamic gender;
    dynamic nameOfEmerContact;
    dynamic relationship;
    dynamic emergencyPhoneNo;
    DateTime createdAt;
    DateTime updatedAt;

    User({
        required this.userId,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.username,
        required this.phoneNo1,
        required this.phoneNo2,
        required this.age,
        required this.gender,
        required this.nameOfEmerContact,
        required this.relationship,
        required this.emergencyPhoneNo,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        username: json["username"],
        phoneNo1: json["phoneNo1"],
        phoneNo2: json["phoneNo2"],
        age: json["age"],
        gender: json["gender"],
        nameOfEmerContact: json["nameOfEmerContact"],
        relationship: json["relationship"],
        emergencyPhoneNo: json["emergencyPhoneNo"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "username": username,
        "phoneNo1": phoneNo1,
        "phoneNo2": phoneNo2,
        "age": age,
        "gender": gender,
        "nameOfEmerContact": nameOfEmerContact,
        "relationship": relationship,
        "emergencyPhoneNo": emergencyPhoneNo,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
