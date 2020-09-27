import 'dart:convert';

import 'package:src/models/Charity.dart';
import 'package:src/models/Interest.dart';
import 'package:http/http.dart' as http;
import 'package:src/models/Profile.dart';

class API {
  static final endpoint = "http://charityswipe.eu-gb.mybluemix.net";

  static Future<List<Interest>> getInterests() async {
    return [
      Interest(1, "Animals"),
      Interest(2, "Clean Water"),
      Interest(3, "Animals"),
      Interest(4, "Wildfires"),
      Interest(5, "Clean Water"),
      Interest(6, "Clean Water"),
      Interest(7, "Animals"),
      Interest(8, "Wildfires"),
      Interest(9, "Animals"),
      Interest(10, "Food Shortages"),
      Interest(11, "Flooding"),
      Interest(12, "Wildfires"),
      Interest(13, "Clean Water"),
      Interest(14, "Flooding"),
      Interest(15, "Clean Water"),
      Interest(16, "Flooding"),
      Interest(17, "Animals"),
      Interest(18, "Wildfires"),
      Interest(19, "Flooding"),
      Interest(20, "Wildfires"),
      Interest(21, "Flooding"),
      Interest(22, "Wildfires"),
      Interest(23, "Animals"),
      Interest(24, "Wildfires"),
    ];

    final response = await http.get(API.endpoint + "/interests");

    if (response.statusCode == 200) {
    } else {
      throw Exception("Failed to fetch interests.");
    }
  }

  static Future<Profile> createProfile() async {
    final response = await http.post(API.endpoint + "/profile");

    if (response.statusCode == 200) {
      return Profile.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to create profile.");
    }
  }

  static Future<List<Charity>> getCharityStack() async {
    return [
      Charity(
          id: 1,
          name: "Save the tigers",
          description:
              "“Save tigers now” is a global campaign by World Wildlife Fund and Leonardo DiCaprio to build political, financial and public support to double the number of wild tigers by 2022, the next year of the tiger.",
          label: "WWF",
          imageUrl:
              "https://static.scientificamerican.com/sciam/cache/file/5C51E427-1715-44E6-9B14D9487D7B7F2D_source.jpg"),
      Charity(
          id: 2,
          name: "Save the tigers",
          description:
              "“Save tigers now” is a global campaign by World Wildlife Fund and Leonardo DiCaprio to build political, financial and public support to double the number of wild tigers by 2022, the next year of the tiger.",
          label: "WWF",
          imageUrl:
              "https://static.scientificamerican.com/sciam/cache/file/5C51E427-1715-44E6-9B14D9487D7B7F2D_source.jpg"),
    ];
  }
}
