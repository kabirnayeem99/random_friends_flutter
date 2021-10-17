/// latitude : "-60.6244"
/// longitude : "150.3285"

class Coordinates {
  Coordinates({
    required String latitude,
    required String longitude,
  }) {
    _latitude = latitude;
    _longitude = longitude;
  }

  Coordinates.fromJson(dynamic json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }

  late String _latitude;
  late String _longitude;

  String get latitude => _latitude;

  String get longitude => _longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    return map;
  }
}