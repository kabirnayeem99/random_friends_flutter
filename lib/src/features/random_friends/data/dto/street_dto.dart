/// number : 1512
/// name : "Duke St"

class StreetDto {
  StreetDto({
    required int number,
    required String name,
  }) {
    _number = number;
    _name = name;
  }

  StreetDto.empty() {
    _number = 0;
    _name = "";
  }

  StreetDto.fromJson(dynamic json) {
    _number = json['number'];
    _name = json['name'];
  }

  late int _number;
  late String _name;

  int get number => _number;

  String get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = _number;
    map['name'] = _name;
    return map;
  }
}
