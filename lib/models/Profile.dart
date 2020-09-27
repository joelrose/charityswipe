import 'package:src/models/Interest.dart';

class Profile {
  Profile(this.id, this.name);

  final String id;
  final String name;
  final List<Interest> interests = [];
}
