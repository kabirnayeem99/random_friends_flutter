/// seed : "5938793a5d195119"
/// results : 1
/// page : 1
/// version : "1.3"

class Info {
  Info({
    required String seed,
    required int results,
    required int page,
    required String version,
  }) {
    _seed = seed;
    _results = results;
    _page = page;
    _version = version;
  }

  Info.fromJson(dynamic json) {
    _seed = json['seed'];
    _results = json['results'];
    _page = json['page'];
    _version = json['version'];
  }

  late String _seed;
  late int _results;
  late int _page;
  late String _version;

  String get seed => _seed;

  int get results => _results;

  int get page => _page;

  String get version => _version;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['seed'] = _seed;
    map['results'] = _results;
    map['page'] = _page;
    map['version'] = _version;
    return map;
  }
}