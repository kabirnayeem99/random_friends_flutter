import 'package:random_friends_flutter/src/features/random_friends/data/dto/results_dto.dart';

import 'info_dto.dart';

/// results : [{"gender":"female","name":{"title":"Miss","first":"Ariane","last":"Addy"},"location":{"street":{"number":1512,"name":"Duke St"},"city":"Cumberland","state":"Manitoba","country":"Canada","postcode":"I6H 0P7","coordinates":{"latitude":"-60.6244","longitude":"150.3285"},"timezone":{"offset":"+10:00","description":"Eastern Australia, Guam, Vladivostok"}},"email":"ariane.addy@example.com","login":{"uuid":"202f2632-cccc-4ca0-b549-5a45d78f1643","username":"organicgoose681","password":"defiant","salt":"VVVXOd9t","md5":"4a2f766faa369a8735ce9d1a74468f0c","sha1":"e7166122458187276bb82e17c3df957db5d88b89","sha256":"9f6d2f551d3bdf0e8a284cc9a8fe391b7df7db7a6bef66e9a17cd465057381a5"},"dob":{"date":"1959-01-02T06:08:25.887Z","age":62},"registered":{"date":"2007-10-08T15:34:22.161Z","age":14},"phone":"459-142-2227","cell":"021-456-5847","id":{"name":"","value":null},"picture":{"large":"https://randomuser.me/api/portraits/women/82.jpg","medium":"https://randomuser.me/api/portraits/med/women/82.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/women/82.jpg"},"nat":"CA"}]
/// info : {"seed":"5938793a5d195119","results":1,"page":1,"version":"1.3"}

class RandomUserResponseDto {
  RandomUserResponseDto({
    required List<Results> results,
    required Info info,
  }) {
    _results = results;
    _info = info;
  }

  RandomUserResponseDto.fromJson(dynamic json) {
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results.add(Results.fromJson(v));
      });
    }
    _info = (json['info'] != null ? Info.fromJson(json['info']) : null)!;
  }

  late List<Results> _results;
  late Info _info;

  List<Results> get results => _results;

  Info get info => _info;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = _results.map((v) => v.toJson()).toList();
    map['info'] = _info.toJson();
    return map;
  }
}




