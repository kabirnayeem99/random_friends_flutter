// offset : "+10:00"
/// description : "Eastern Australia, Guam, Vladivostok"

class Timezone {
  Timezone({
    required String offset,
    required String description,
  }) {
    _offset = offset;
    _description = description;
  }

  Timezone.fromJson(dynamic json) {
    _offset = json['offset'];
    _description = json['description'];
  }

  late String _offset;
  late String _description;

  String get offset => _offset;

  String get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['offset'] = _offset;
    map['description'] = _description;
    return map;
  }
}