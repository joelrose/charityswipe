class Interest {
  Interest(this.id, this.name);

  final int id;
  final String name;

  factory Interest.fromJson(Map<String, dynamic> json) {
    return Interest(json["id"], json["name"]);
  }
}
