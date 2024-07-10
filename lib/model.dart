// class ModelPegawai {
//   int? _id;
//   String? _firstName, _lastName, _mobileNo, _emailId;
//   ModelPegawai(this._firstName, this._lastName, this._mobileNo,
//       this._emailId);
//   int get id => _id ?? 0;
//   String get firstname => _firstName ?? "";
//   String get lastname => _lastName ?? "";
//   String get mobileNo => _mobileNo ?? "";
//   String get emailId => _emailId ?? "";
//   Map<String, dynamic> toMap() {
//     var map = <String, dynamic>{};
//     if (_id != null) {
//       map["id"] = _id;
//     }
//     map["firstname"] = _firstName;
//     map["lastname"] = _lastName;
//     map["mobileno"] = _mobileNo;
//     map["emailid"] = _emailId;
//     return map;
//   }
//   ModelPegawai.froMap(Map<String, dynamic> map) {
//     _id = map["id"];
//     _firstName = map["firstname"];
//     _lastName = map["lastname"];
//     _mobileNo = map["mobileno"];
//     _emailId = map["emailid"];
//   }
// }

class ModelMahasiswa {
  int? _id;
  String? _nama, _noBP, _noHP, _email, _alamat;

  ModelMahasiswa(this._nama, this._noBP, this._noHP, this._email, this._alamat);

  int get id => _id ?? 0;
  String get nama => _nama ?? "";
  String get noBP => _noBP ?? "";
  String get noHP => _noHP ?? "";
  String get email => _email ?? "";
  String get alamat => _alamat ?? "";

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (_id != null) {
      map["id"] = _id;
    }
    map["nama"] = _nama;
    map["nobp"] = _noBP;
    map["nohp"] = _noHP;
    map["email"] = _email;
    map["alamat"] = _alamat;
    return map;
  }

  ModelMahasiswa.fromMap(Map<String, dynamic> map) {
    _id = map["id"];
    _nama = map["nama"];
    _noBP = map["nobp"];
    _noHP = map["nohp"];
    _email = map["email"];
    _alamat = map["alamat"];
  }
}
