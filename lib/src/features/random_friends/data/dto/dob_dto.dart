/// date : "1959-01-02T06:08:25.887Z"
/// age : 62

class Dob {
  Dob({
    required String date,
    required int age,
  }) {
    _date = date;
    _age = age;
  }

  Dob.fromJson(dynamic json) {
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