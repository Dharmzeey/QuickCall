import 'package:get/get.dart';
import 'package:quickcall/api/information.dart';
import 'package:quickcall/models/user_model.dart';

class UserProfileController extends GetxController {
  UserProfileController() {
    fetchPersonalInformation();
    fetchmedicalInformation();
  }
  final displayDetailsController = Get.put(DisplayDetailsController());
  User? _personalInformation;
  User? get personalInformation => _personalInformation;
  Future<dynamic> fetchPersonalInformation() async {
    try {
      final jsonData = await UserInfo().fetchBasicInfo();
      _personalInformation = User.fromJson(jsonData['userInformation']);
      displayDetailsController.displayName.value =
          _personalInformation!.firstName;
      displayDetailsController.displayGender.value =
          _personalInformation!.gender;
      displayDetailsController.isLoggedIn.value = true;
      return _personalInformation;
    } catch (e) {
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
      return null;
    }
  }
}

class DisplayDetailsController extends GetxController {
  RxString displayName = "".obs;
  RxString displayGender = "".obs;
  RxBool isLoggedIn = false.obs;
}
