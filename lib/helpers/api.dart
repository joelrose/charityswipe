import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:src/models/Charity.dart';
import 'package:src/models/Interest.dart';
import 'package:http/http.dart' as http;
import 'package:src/models/Profile.dart';

class API {
  static final endpoint = "http://charityswipe.eu-gb.mybluemix.net";
  static final localStorage = LocalStorage("fund");

  static Future<List<Interest>> getInterests() async {
    final response = await http.get(API.endpoint + "/interests");

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Interest> interests = [];
      for (var item in data) interests.add(Interest.fromJson(item));
      return interests;
    } else {
      throw Exception("Failed to fetch interests.");
    }
  }

  static Future<Profile> createProfile() async {
    final response = await http.post(API.endpoint + "/profile");

    if (response.statusCode == 200) {
      final profile = Profile.fromJson(json.decode(response.body));
      await localStorage.setItem("profile", profile.id);
      return profile;
    } else {
      throw Exception("Failed to create profile.");
    }
  }

  static Future<Profile> setInterests(
      String profileId, List<Interest> interests) async {
    String endpointUrl =
        API.endpoint + "/profile/" + localStorage.getItem("profile").toString();
    final response = await http.put(endpointUrl,
        body: json.encode(interests.map((e) => e.id).toList()));

    if (response.statusCode == 200) {
      return Profile.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to update interests.");
    }
  }

  static Future<List<Charity>> getCharityStack() async {
    String endpointUrl =
        API.endpoint + "/profile/" + localStorage.getItem("profile") + "/match";
    final response = await http.get(endpointUrl);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Charity> charities = [];
      for(int i = 0; i < 2; i++) { // TO DO: Remove
        for (var item in data) charities.add(Charity.fromJson(item));
      }
      return charities;
    } else {
      throw Exception("Failed to get match stack.");
    }
  }
}
