import 'package:get/get.dart';
import 'package:quickcall/api/information.dart';
import 'package:quickcall/models/user_model.dart';

class UserProfileController extends GetxController {
  UserProfileController() {
    fetchPersonalInformation();
    fetchmedicalInformation();
  }
  User? _personalInformation;
  User? get personalInformation => _personalInformation;
  Future<dynamic> fetchPersonalInformation() async {
    try {
      final jsonData = await UserInfo().fetchBasicInfo();
      _personalInformation = User.fromJson(jsonData['userInformation']);
      return _personalInformation;
    } catch (e) {
      print('An error occured $e');
      return null;
    }
  }

  MedicalInformaton? _medicalInformation;
  MedicalInformaton? get medicalInformation => _medicalInformation;
  Future<dynamic> fetchmedicalInformation() async {
    try {
      final jsonData = await UserInfo().fetchMedicalInfo();
      _medicalInformation =
          MedicalInformaton.fromJson(jsonData['medicalInformaton']);
      return _medicalInformation;
    } catch (e) {
      print('An error occured $e');
      return null;
    }
  }
}

class DisplayNameController extends GetxController {
  RxString displayName = "".obs;
}
