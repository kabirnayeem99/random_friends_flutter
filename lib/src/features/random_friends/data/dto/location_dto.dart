import 'coordinates_dto.dart';
import 'street_dto.dart';
import 'time_zone_dto.dart';

/// street : {"number":1512,"name":"Duke St"}
/// city : "Cumberland"
/// state : "Manitoba"
/// country : "Canada"
/// postcode : "I6H 0P7"
/// coordinates : {"latitude":"-60.6244","longitude":"150.3285"}
/// timezone : {"offset":"+10:00","description":"Eastern Australia, Guam, Vladivostok"}

class Location {
  Location({
    required Street street,
    required String city,
    required String state,
    required String country,
    required String postcode,
    required Coordinates coordinates,
    required Timezone timezone,
  }) {
    _street = street;
    _city = city;
    _state = state;
    _country = country;
    _postcode = postcode;
    _coordinates = coordinates;
    _timezone = timezone;
  }

  Location.fromJson(dynamic json) {
    _street =
        (json['street'] != null ? Street.fromJson(json['street']) : null)!;
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _postcode = json['postcode'];
    _coordinates = (json['coordinates'] != null
        ? Coordinates.fromJson(json['coordinates'])
        : null)!;
    _timezone = (json['timezone'] != null
        ? Timezone.fromJson(json['timezone'])
        : null)!;
  }

  late Street _street;
  late String _city;
  late String _state;
  late String _country;
  late String _postcode;
  late Coordinates _coordinates;
  late Timezone _timezone;

  Street get street => _street;

  String get city => _city;

  String get state => _state;

  String get country => _country;

  String get postcode => _postcode;

  Coordinates get coordinates => _coordinates;

  Timezone get timezone => _timezone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = _street.toJson();
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['postcode'] = _postcode;
    map['coordinates'] = _coordinates.toJson();
    map['timezone'] = _timezone.toJson();
    return map;
  }
}
