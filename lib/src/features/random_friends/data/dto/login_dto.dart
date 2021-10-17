
/// uuid : "202f2632-cccc-4ca0-b549-5a45d78f1643"
/// username : "organicgoose681"
/// password : "defiant"
/// salt : "VVVXOd9t"
/// md5 : "4a2f766faa369a8735ce9d1a74468f0c"
/// sha1 : "e7166122458187276bb82e17c3df957db5d88b89"
/// sha256 : "9f6d2f551d3bdf0e8a284cc9a8fe391b7df7db7a6bef66e9a17cd465057381a5"

class Login {
  Login({
    required String uuid,
    required String username,
    required String password,
    required String salt,
    required String md5,
    required String sha1,
    required String sha256,
  }) {
    _uuid = uuid;
    _username = username;
    _password = password;
    _salt = salt;
    _md5 = md5;
    _sha1 = sha1;
    _sha256 = sha256;
  }

  Login.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _username = json['username'];
    _password = json['password'];
    _salt = json['salt'];
    _md5 = json['md5'];
    _sha1 = json['sha1'];
    _sha256 = json['sha256'];
  }

  late String _uuid;
  late String _username;
  late String _password;
  late String _salt;
  late String _md5;
  late String _sha1;
  late String _sha256;

  String get uuid => _uuid;

  String get username => _username;

  String get password => _password;

  String get salt => _salt;

  String get md5 => _md5;

  String get sha1 => _sha1;

  String get sha256 => _sha256;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['username'] = _username;
    map['password'] = _password;
    map['salt'] = _salt;
    map['md5'] = _md5;
    map['sha1'] = _sha1;
    map['sha256'] = _sha256;
    return map;
  }
}