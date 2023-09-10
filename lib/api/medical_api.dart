import 'package:http/http.dart' as http;
import 'package:quickcall/utils/urls.dart';

class MedicalApi {
  var url = Uri.https(AppUrls.medicalUrl);

  Future getMedicals() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = response.body;
    }
  }
}
