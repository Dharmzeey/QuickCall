import 'package:get/get.dart';
import 'package:quickcall/api/emergencies.dart';
import 'package:quickcall/controller/location_controller.dart';
import 'package:quickcall/models/emergency_info_model.dart';
import 'package:quickcall/utils/urls.dart';

class EmergencyController extends GetxController {
  EmergencyController({required this.emergencyType}) {
    fetchEmergencyResponse();
  }

  final String emergencyType;
  final String currentLongitude =
      Get.find<LocationController>().currentLongitude;
  final String currentLatitude = Get.find<LocationController>().currentLatitude;

  final nearbyPlaces = <NearbyPlace>[];
  final emergencyContacts = <EmergencyContact>[];
  final notablePeople = <NotablePerson>[];
  final emergencyTips = <EmergencyTip>[];

  late Map<String, List> emergencyData = {};

  Future<void> fetchEmergencyResponse() async {
    final String url =
        '${AppUrls.baseUrl}${AppUrls.emergencyInformation}/$currentLatitude/$currentLongitude/$emergencyType';
    final EmergenciesApi emergenciesApi = EmergenciesApi(url: url);

    try {
      final jsonData = await emergenciesApi.fetchData();
      print('Na init');

      final List<NearbyPlace> fetchPlaces = jsonData['nearby_places']
          ?.map((json) => NearbyPlace.fromJson(json))
          .toList()
          .cast<NearbyPlace>();
      nearbyPlaces.assignAll(fetchPlaces);

      final List<EmergencyContact> fetchedContact =
          jsonData['emergencyContacts']
              ?.map((json) => EmergencyContact.fromJson(json))
              .toList()
              .cast<EmergencyContact>();

      emergencyContacts.assignAll(fetchedContact);

      final List<NotablePerson> fetchPerson = jsonData['notablePeople']
          ?.map((json) => NotablePerson.fromJson(json))
          .toList()
          .cast<NotablePerson>();
      notablePeople.assignAll(fetchPerson);

      final List<EmergencyTip> fetchTips = jsonData['emergencyTips']
          .map((json) => EmergencyTip.fromJson(json))
          .toList()
          .cast<EmergencyTip>();
      emergencyTips.assignAll(fetchTips);
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}
