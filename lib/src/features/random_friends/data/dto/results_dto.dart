import 'dart:html';
import 'dart:ui';

import 'package:random_friends_flutter/src/features/random_friends/data/dto/id_dto.dart';

import 'name_dto.dart';
import 'street_dto.dart';
import 'dob_dto.dart';
import 'location_dto.dart';
import 'picture_dto.dart';
import 'time_zone_dto.dart';
import 'registered_dto.dart';
import 'login_dto.dart';

/// gender : "female"
/// name : {"title":"Miss","first":"Ariane","last":"Addy"}
/// location : {"street":{"number":1512,"name":"Duke St"},"city":"Cumberland","state":"Manitoba","country":"Canada","postcode":"I6H 0P7","coordinates":{"latitude":"-60.6244","longitude":"150.3285"},"timezone":{"offset":"+10:00","description":"Eastern Australia, Guam, Vladivostok"}}
/// email : "ariane.addy@example.com"
/// login : {"uuid":"202f2632-cccc-4ca0-b549-5a45d78f1643","username":"organicgoose681","password":"defiant","salt":"VVVXOd9t","md5":"4a2f766faa369a8735ce9d1a74468f0c","sha1":"e7166122458187276bb82e17c3df957db5d88b89","sha256":"9f6d2f551d3bdf0e8a284cc9a8fe391b7df7db7a6bef66e9a17cd465057381a5"}
/// dob : {"date":"1959-01-02T06:08:25.887Z","age":62}
/// registered : {"date":"2007-10-08T15:34:22.161Z","age":14}
/// phone : "459-142-2227"
/// cell : "021-456-5847"
/// id : {"name":"","value":null}
/// picture : {"large":"https://randomuser.me/api/portraits/women/82.jpg","medium":"https://randomuser.me/api/portraits/med/women/82.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/women/82.jpg"}
/// nat : "CA"

class Results {
  Results({
    required String gender,
    required Name name,
    required Location location,
    required String email,
    required Login login,
    required Dob dob,
    required Registered registered,
    required String phone,
    required String cell,
    required Id id,
    required Picture picture,
    required String nat,
  }) {
    _gender = gender;
    _name = name;
    _location = location;
    _email = email;
    _login = login;
    _dob = dob;
    _registered = registered;
    _phone = phone;
    _cell = cell;
    _id = id;
    _picture = picture;
    _nat = nat;
  }

  Results.fromJson(dynamic json) {
    _gender = json['gender'];
    _name = (json['name'] != null ? Name.fromJson(json['name']) : null)!;
    _location = (json['location'] != null
        ? Location.fromJson(json['location'])
        : null)!;
    _email = json['email'];
    _login = (json['login'] != null ? Login.fromJson(json['login']) : null)!;
    _dob = (json['dob'] != null ? Dob.fromJson(json['dob']) : null)!;
    _registered = (json['registered'] != null
        ? Registered.fromJson(json['registered'])
        : null)!;
    _phone = json['phone'];
    _cell = json['cell'];
    _id = (json['id'] != null ? Id.fromJson(json['id']) : null)!;
    _picture =
        (json['picture'] != null ? Picture.fromJson(json['picture']) : null)!;
    _nat = json['nat'];
  }

  late String _gender;
  late Name _name;
  late Location _location;
  late String _email;
  late Login _login;
  late Dob _dob;
  late Registered _registered;
  late String _phone;
  late String _cell;
  late Id _id;
  late Picture _picture;
  late String _nat;

  String get gender => _gender;

  Name get name => _name;

  Location get location => _location;

  String get email => _email;

  Login get login => _login;

  Dob get dob => _dob;

  Registered get registered => _registered;

  String get phone => _phone;

  String get cell => _cell;

  Id get id => _id;

  Picture get picture => _picture;

  String get nat => _nat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gender'] = _gender;
    map['name'] = _name.toJson();
    map['location'] = _location.toJson();
    map['email'] = _email;
    map['login'] = _login.toJson();
    map['dob'] = _dob.toJson();
    map['registered'] = _registered.toJson();
    map['phone'] = _phone;
    map['cell'] = _cell;
    map['id'] = _id.toJson();
    map['picture'] = _picture.toJson();
    map['nat'] = _nat;
    return map;
  }
}
