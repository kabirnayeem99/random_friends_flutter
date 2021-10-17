class User {
  String id = "";
  String pictureUrl = "";
  String name = "";
  String cell = "";

  User({
    required this.id,
    required this.pictureUrl,
    required this.name,
    required this.cell,
  });

  @override
  String toString() {
    return "$id $pictureUrl $name";
  }
}
