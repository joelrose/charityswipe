import 'package:flutter/material.dart';
import 'package:src/models/Interest.dart';

class Charity {
  Charity(
      {@required this.id,
      @required this.name,
      this.description,
      this.label,
      this.imageUrl,
      this.relatedInterests,
      this.donationValue});

  final int id;
  final String name;
  String description = "";
  String label = "";
  String imageUrl = "";
  List<Interest> relatedInterests = [];
  double donationValue = 0;

  factory Charity.fromJson(Map<String, dynamic> json) {
    return Charity(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        label: json["label"] ?? "",
        imageUrl: json["image"],
        relatedInterests: []);
  }
}
