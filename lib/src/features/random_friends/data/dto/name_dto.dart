/// title : "Miss"
/// first : "Ariane"
/// last : "Addy"

class NameDto {
  NameDto(title, first, last) {
    _title = title;
    _first = first;
    _last = last;
  }

  NameDto.empty() {
    _title = "";
    _first = "";
    _last = "";
  }

  NameDto.fromJson(dynamic json) {
    _title = json['title'];
    _first = json['first'];
    _last = json['last'];
  }

  late String _title;
  late String _first;
  late String _last;

  String get title => _title;

  String get first => _first;

  String get last => _last;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['first'] = _first;
    map['last'] = _last;
    return map;
  }
}
