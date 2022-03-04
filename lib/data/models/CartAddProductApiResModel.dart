/// status : 1
/// message : "Product updated successfully!"
/// count : "1 items"

class CartAddProductApiResModel {
  CartAddProductApiResModel({
      int? status, 
      String? message, 
      String? count,}){
    _status = status;
    _message = message;
    _count = count;
}

  CartAddProductApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _count = json['count'];
  }
  int? _status;
  String? _message;
  String? _count;

  int? get status => _status;
  String? get message => _message;
  String? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['count'] = _count;
    return map;
  }

}