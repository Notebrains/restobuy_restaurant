/// status : 1
/// message : "Login Success"
/// response : {"user_id":9,"name":"Ozora","email":"tapan@gmail.com","mobile":"4236517890","image":"","dob":"01-01-1970","gender":"Male","city":"","country":"","access_token":"VEZTSDkwNm9INm93YTBjRWxyQ09CSGN5Mk12ZzN1NHc3ODY1OWIzNTl1WHV1ZlVTYmsySzhDTjM0amVx61fbba1a92e0f"}

class LoginApiResModel {
  LoginApiResModel({
      int? status, 
      String? message, 
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  LoginApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  int? _status;
  String? _message;
  Response? _response;

  int? get status => _status;
  String? get message => _message;
  Response? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_response != null) {
      map['response'] = _response?.toJson();
    }
    return map;
  }

}

/// user_id : 9
/// name : "Ozora"
/// email : "tapan@gmail.com"
/// mobile : "4236517890"
/// image : ""
/// dob : "01-01-1970"
/// gender : "Male"
/// city : ""
/// country : ""
/// access_token : "VEZTSDkwNm9INm93YTBjRWxyQ09CSGN5Mk12ZzN1NHc3ODY1OWIzNTl1WHV1ZlVTYmsySzhDTjM0amVx61fbba1a92e0f"

class Response {
  Response({
      int? userId, 
      String? name, 
      String? email, 
      String? mobile, 
      String? image, 
      String? dob, 
      String? gender, 
      String? city, 
      String? country, 
      String? accessToken,}){
    _userId = userId;
    _name = name;
    _email = email;
    _mobile = mobile;
    _image = image;
    _dob = dob;
    _gender = gender;
    _city = city;
    _country = country;
    _accessToken = accessToken;
}

  Response.fromJson(dynamic json) {
    _userId = json['user_id'];
    _name = json['name'];
    _email = json['email'];
    _mobile = json['mobile'];
    _image = json['image'];
    _dob = json['dob'];
    _gender = json['gender'];
    _city = json['city'];
    _country = json['country'];
    _accessToken = json['access_token'];
  }
  int? _userId;
  String? _name;
  String? _email;
  String? _mobile;
  String? _image;
  String? _dob;
  String? _gender;
  String? _city;
  String? _country;
  String? _accessToken;

  int? get userId => _userId;
  String? get name => _name;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get image => _image;
  String? get dob => _dob;
  String? get gender => _gender;
  String? get city => _city;
  String? get country => _country;
  String? get accessToken => _accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['name'] = _name;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['image'] = _image;
    map['dob'] = _dob;
    map['gender'] = _gender;
    map['city'] = _city;
    map['country'] = _country;
    map['access_token'] = _accessToken;
    return map;
  }

}