import 'package:quickcall/api/allow_location_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceActivated {
  Future<bool> getActivationStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool activated = prefs.getBool("isActivated") ?? false;
    return activated;
  }
}

class LocationEnabled {
  Future<bool> isLocationEnabled() async {
    final bool enabled = EnableLocation().permissionStatus;
    return enabled;
  }
}

class UserStatus {
  Future<String> authenticationStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String authStatus =
        prefs.getString('authenticationStatus') ?? "anonymous";
    return authStatus;
  }
}
