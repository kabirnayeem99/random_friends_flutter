/// date : "2007-10-08T15:34:22.161Z"
/// age : 14

class Registered {
  Registered({
    required String date,
    required int age,
  }) {
    _date = date;
    _age = age;
  }

  Registered.fromJson(dynamic json) {
    _date = json['date'];
    _age = json['age'];
  }

  late String _date;
  late int _age;

  String get date => _date;

  int get age => _age;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['age'] = _age;
    return map;
  }
}