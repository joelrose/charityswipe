import 'package:src/models/Interest.dart';

class Profile {
  Profile({this.id, this.name = "", this.interests});

  final String id;
  final String name;
  List<Interest> interests = [];

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(id: json["id"], name: json["name"] ?? "");
  }
}
