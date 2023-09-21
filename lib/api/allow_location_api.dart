import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:quickcall/controller/location_controller.dart';
import 'package:quickcall/utils/colors.dart';

class EnableLocation {
  Position? _currentPosition;
  final LocationController locationController = Get.put(LocationController());

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("Location Disabled",
          'Location services are disabled. Please enable the services',
          colorText: AppColors.mainColor);

      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("Permission Denied",
            'Location permissions are denied, please enable location to use app',
            colorText: AppColors.mainColor);
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("Permanently Disabled",
          'Location permissions are permanently denied, we cannot request permissions.',
          colorText: AppColors.mainColor);
      return false;
    }
    return true;
  }

  Future<void> _setLocation() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      locationController.currentLatitude = position.latitude.toString();
      locationController.currentLongitude = position.longitude.toString();

      _currentPosition = position;
      await _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {});
  }

  get setLocation => _setLocation();
  get permissionStatus => _handleLocationPermission();

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      locationController.hasPermission = true;
      locationController.localGovernment = '${place.subAdministrativeArea}';
      locationController.currentAddress =
          '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
    }).catchError((e) {});
  }
}
