import 'dart:convert';
import 'package:http/http.dart' as http;

class EmergenciesApi {
  final String url;
  EmergenciesApi({required this.url});

  Future<dynamic> fetchData() async {
    final http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return jsonData;
    } else {
      print('Error fetching In: ${response.statusCode}');
      print('Response body for fetching ${response.body}');

      throw Exception('Failed to load data');
    }
  }
}
