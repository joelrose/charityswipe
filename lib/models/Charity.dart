import 'package:flutter/material.dart';
import 'package:src/models/Interest.dart';

class Charity {
  Charity(
      {@required this.id,
      @required this.name,
      this.description,
      this.imageUrl,
      this.relatedInterests});

  final int id;
  final String name;
  String description = "";
  String imageUrl = "";
  List<Interest> relatedInterests = [];

  factory Charity.fromJson(Map<String, dynamic> json) {
    return Charity(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        relatedInterests: []);
  }
}
