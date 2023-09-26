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
    this.phoneNo2,
    required this.age,
    required this.gender,
    this.nameOfEmerContact,
    this.relationship,
    this.emergencyPhoneNo,
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

class MedicalInformaton {
  String medicalId;
  String bloodType;
  String genotype;
  List<String>? allergies;
  List<String>? chronicConditions;
  String? famDocContact;
  DateTime createdAt;
  DateTime updatedAt;
  String userId;

  MedicalInformaton({
    required this.medicalId,
    required this.bloodType,
    required this.genotype,
    this.allergies,
    this.chronicConditions,
    this.famDocContact,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });

  factory MedicalInformaton.fromJson(Map<String, dynamic> json) =>
      MedicalInformaton(
        medicalId: json["medicalId"],
        bloodType: json["bloodType"],
        genotype: json["genotype"],
        allergies: List<String>.from(json["allergies"]?.map((x) => x)),
        chronicConditions:
            List<String>.from(json["chronicConditions"]?.map((x) => x)),
    
        famDocContact: json["famDocContact"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
      );
}
