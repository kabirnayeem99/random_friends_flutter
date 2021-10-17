/// large : "https://randomuser.me/api/portraits/women/82.jpg"
/// medium : "https://randomuser.me/api/portraits/med/women/82.jpg"
/// thumbnail : "https://randomuser.me/api/portraits/thumb/women/82.jpg"

class Picture {
  Picture({
    required String large,
    required String medium,
    required String thumbnail,
  }) {
    _large = large;
    _medium = medium;
    _thumbnail = thumbnail;
  }

  Picture.fromJson(dynamic json) {
    _large = json['large'];
    _medium = json['medium'];
    _thumbnail = json['thumbnail'];
  }

  Picture.empty() {
    _large = "https://picsum.photos/id/237/500/500";
    _medium = "https://picsum.photos/id/237/250/250";
    _thumbnail = "https://picsum.photos/id/237/100/100";
  }

  late String _large;
  late String _medium;
  late String _thumbnail;

  String get large => _large;

  String get medium => _medium;

  String get thumbnail => _thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['large'] = _large;
    map['medium'] = _medium;
    map['thumbnail'] = _thumbnail;
    return map;
  }
}
