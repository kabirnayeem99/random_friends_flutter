/// name : ""
/// value : null

class Id {
  Id({
    required String name,
    dynamic value,
  }) {
    _name = name;
    _value = value;
  }

  Id.generate() {
    _name = DateTime.now().toString();
    _value = DateTime.now().millisecondsSinceEpoch.toString();
  }

  Id.fromJson(dynamic json) {
    _name = json['name'];
    _value = json['value'];
  }

  late String _name;
  late dynamic _value;

  String get name => _name;

  dynamic get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['value'] = _value;
    return map;
  }
}
