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
    required StreetDto street,
    required String city,
    required String state,
    required String country,
    required String postcode,
    required CoordinatesDto coordinates,
    required TimezoneDto timezone,
  }) {
    _street = street;
    _city = city;
    _state = state;
    _country = country;
    _postcode = postcode;
    _coordinates = coordinates;
    _timezone = timezone;
  }

  Location.empty() {
    _street = StreetDto.empty();
    _city = "";
    _state = "";
    _country = "";
    _postcode = "";
    _coordinates = CoordinatesDto.empty();
    _timezone = TimezoneDto.empty();
  }

  Location.fromJson(dynamic json) {
    _street =
        (json['street'] != null ? StreetDto.fromJson(json['street']) : null)!;
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _postcode = json['postcode'].toString();
    _coordinates = (json['coordinates'] != null
        ? CoordinatesDto.fromJson(json['coordinates'])
        : null)!;
    _timezone = (json['timezone'] != null
        ? TimezoneDto.fromJson(json['timezone'])
        : null)!;
  }

  late StreetDto _street;
  late String _city;
  late String _state;
  late String _country;
  late String _postcode;
  late CoordinatesDto _coordinates;
  late TimezoneDto _timezone;

  StreetDto get street => _street;

  String get city => _city;

  String get state => _state;

  String get country => _country;

  String get postcode => _postcode;

  CoordinatesDto get coordinates => _coordinates;

  TimezoneDto get timezone => _timezone;

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
