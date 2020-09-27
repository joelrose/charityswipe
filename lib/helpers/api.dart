import 'package:src/models/Interest.dart';
import 'package:http/http.dart' as http;

class API {
  static final endpoint = "http://charityswipe.eu-gb.mybluemix.net";

  static Future<List<Interest>> getInterests() async {
    return [Interest(1, "Animals"), Interest(2, "Wildfires")];

    final response = await http.get(API.endpoint + "/interests");

    if (response.statusCode == 200) {
    } else {
      throw Exception("Failed to fetch interests.");
    }
  }
}
