// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    String status;
    List<EmergencyContact> emergencyContacts;
    List<NotablePerson> notablePeople;
    List<NearbyPlace> nearbyPlaces;
    List<EmergencyTip> emergencyTips;
    String localGovt;

    Welcome({
        required this.status,
        required this.emergencyContacts,
        required this.notablePeople,
        required this.nearbyPlaces,
        required this.emergencyTips,
        required this.localGovt,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        status: json["status"],
        emergencyContacts: List<EmergencyContact>.from(json["emergencyContacts"].map((x) => EmergencyContact.fromJson(x))),
        notablePeople: List<NotablePerson>.from(json["notablePeople"].map((x) => NotablePerson.fromJson(x))),
        nearbyPlaces: List<NearbyPlace>.from(json["nearby_places"].map((x) => NearbyPlace.fromJson(x))),
        emergencyTips: List<EmergencyTip>.from(json["emergencyTips"].map((x) => EmergencyTip.fromJson(x))),
        localGovt: json["localGovt"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "emergencyContacts": List<dynamic>.from(emergencyContacts.map((x) => x.toJson())),
        "notablePeople": List<dynamic>.from(notablePeople.map((x) => x.toJson())),
        "nearby_places": List<dynamic>.from(nearbyPlaces.map((x) => x.toJson())),
        "emergencyTips": List<dynamic>.from(emergencyTips.map((x) => x.toJson())),
        "localGovt": localGovt,
    };
}

class EmergencyContact {
    String contactId;
    String emergencyType;
    String emergencyNo;
    String whatsappContact;
    DateTime createdAt;
    DateTime updatedAt;
    String lgaId;

    EmergencyContact({
        required this.contactId,
        required this.emergencyType,
        required this.emergencyNo,
        required this.whatsappContact,
        required this.createdAt,
        required this.updatedAt,
        required this.lgaId,
    });

    factory EmergencyContact.fromJson(Map<String, dynamic> json) => EmergencyContact(
        contactId: json["contactId"],
        emergencyType: json["emergencyType"],
        emergencyNo: json["emergencyNo"],
        whatsappContact: json["whatsappContact"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        lgaId: json["LGAId"],
    );

    Map<String, dynamic> toJson() => {
        "contactId": contactId,
        "emergencyType": emergencyType,
        "emergencyNo": emergencyNo,
        "whatsappContact": whatsappContact,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "LGAId": lgaId,
    };
}

class EmergencyTip {
    String tipId;
    String category;
    String title;
    String description;
    DateTime createdAt;
    DateTime updatedAt;

    EmergencyTip({
        required this.tipId,
        required this.category,
        required this.title,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
    });

    factory EmergencyTip.fromJson(Map<String, dynamic> json) => EmergencyTip(
        tipId: json["tipId"],
        category: json["category"],
        title: json["title"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "tipId": tipId,
        "category": category,
        "title": title,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class NearbyPlace {
    int userRatingsTotal;
    String vicinity;
    double lat;
    double lng;
    String name;
    OpeningHours? openingHours;

    NearbyPlace({
        required this.userRatingsTotal,
        required this.vicinity,
        required this.lat,
        required this.lng,
        required this.name,
        this.openingHours,
    });

    factory NearbyPlace.fromJson(Map<String, dynamic> json) => NearbyPlace(
        userRatingsTotal: json["user_ratings_total"],
        vicinity: json["vicinity"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        name: json["name"],
        openingHours: json["opening_hours"] == null ? null : OpeningHours.fromJson(json["opening_hours"]),
    );

    Map<String, dynamic> toJson() => {
        "user_ratings_total": userRatingsTotal,
        "vicinity": vicinity,
        "lat": lat,
        "lng": lng,
        "name": name,
        "opening_hours": openingHours?.toJson(),
    };
}

class OpeningHours {
    bool openNow;

    OpeningHours({
        required this.openNow,
    });

    factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
        openNow: json["open_now"],
    );

    Map<String, dynamic> toJson() => {
        "open_now": openNow,
    };
}

class NotablePerson {
    String notableId;
    String position;
    String personName;
    String phoneNo;
    String whatsappContact;
    DateTime createdAt;
    DateTime updatedAt;
    String? lgaId;
    String? stateId;

    NotablePerson({
        required this.notableId,
        required this.position,
        required this.personName,
        required this.phoneNo,
        required this.whatsappContact,
        required this.createdAt,
        required this.updatedAt,
        this.lgaId,
        this.stateId,
    });

    factory NotablePerson.fromJson(Map<String, dynamic> json) => NotablePerson(
        notableId: json["notableId"],
        position: json["position"],
        personName: json["personName"],
        phoneNo: json["phoneNo"],
        whatsappContact: json["whatsappContact"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        lgaId: json["LGAId"],
        stateId: json["stateId"],
    );

    Map<String, dynamic> toJson() => {
        "notableId": notableId,
        "position": position,
        "personName": personName,
        "phoneNo": phoneNo,
        "whatsappContact": whatsappContact,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "LGAId": lgaId,
        "stateId": stateId,
    };
}
