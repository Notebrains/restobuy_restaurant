/// status : 1
/// message : "Product List"
/// response : [{"product_id":3,"product_name":"Fruits and Vegitables","productid":"PRD00003","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/download (2)-1629288288.jpg","price":"$50 - $100","rating":3,"variant":[{"variant_id":70,"unit":"1 Kg","price":"50"},{"variant_id":71,"unit":"2 Kg","price":"100"}]},{"product_id":2,"product_name":"Farm Quail Eggs","productid":"PRD00002","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/40094157_2-fresho-farm-quail-eggs-small-antibiotic-residue-free-1628492715.jpg","price":"$75 - $400","rating":4,"variant":[{"variant_id":65,"unit":"6 Pcs","price":"75"},{"variant_id":66,"unit":"4 x 6 Pcs Multipack","price":"300"},{"variant_id":67,"unit":"5 x 6 Pcs Multipack","price":"400"}]},{"product_id":1,"product_name":"Mutton - Mince","productid":"PRD00001","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/fresho-mutton-mince-antibiotic-residue-free-growth-hormone-free-1628493230.jpg","price":"$400 - $3500","rating":0,"variant":[{"variant_id":56,"unit":"500 g","price":"400"},{"variant_id":57,"unit":"1 Kg","price":"800"},{"variant_id":58,"unit":"5 Kg","price":"3500"}]}]

class ProductApiResModel {
  ProductApiResModel({
      int? status, 
      String? message, 
      List<Response>? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  ProductApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['response'] != null) {
      _response = [];
      json['response'].forEach((v) {
        _response?.add(Response.fromJson(v));
      });
    }
  }
  int? _status;
  String? _message;
  List<Response>? _response;

  int? get status => _status;
  String? get message => _message;
  List<Response>? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_response != null) {
      map['response'] = _response?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// product_id : 3
/// product_name : "Fruits and Vegitables"
/// productid : "PRD00003"
/// image : "https://mridayaitservices.com/demo/restobuy/uploads/product/download (2)-1629288288.jpg"
/// price : "$50 - $100"
/// rating : 3
/// variant : [{"variant_id":70,"unit":"1 Kg","price":"50"},{"variant_id":71,"unit":"2 Kg","price":"100"}]

class Response {
  Response({
      int? productId, 
      String? productName, 
      String? productid, 
      String? image, 
      String? price, 
      int? rating, 
      List<Variant>? variant,}){
    _productId = productId;
    _productName = productName;
    _productid = productid;
    _image = image;
    _price = price;
    _rating = rating;
    _variant = variant;
}

  Response.fromJson(dynamic json) {
    _productId = json['product_id'];
    _productName = json['product_name'];
    _productid = json['productid'];
    _image = json['image'];
    _price = json['price'];
    _rating = json['rating'];
    if (json['variant'] != null) {
      _variant = [];
      json['variant'].forEach((v) {
        _variant?.add(Variant.fromJson(v));
      });
    }
  }
  int? _productId;
  String? _productName;
  String? _productid;
  String? _image;
  String? _price;
  int? _rating;
  List<Variant>? _variant;

  int? get productId => _productId;
  String? get productName => _productName;
  String? get productid => _productid;
  String? get image => _image;
  String? get price => _price;
  int? get rating => _rating;
  List<Variant>? get variant => _variant;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['product_name'] = _productName;
    map['productid'] = _productid;
    map['image'] = _image;
    map['price'] = _price;
    map['rating'] = _rating;
    if (_variant != null) {
      map['variant'] = _variant?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// variant_id : 70
/// unit : "1 Kg"
/// price : "50"

class Variant {
  Variant({
      int? variantId, 
      String? unit, 
      String? price,}){
    _variantId = variantId;
    _unit = unit;
    _price = price;
}

  Variant.fromJson(dynamic json) {
    _variantId = json['variant_id'];
    _unit = json['unit'];
    _price = json['price'];
  }
  int? _variantId;
  String? _unit;
  String? _price;

  int? get variantId => _variantId;
  String? get unit => _unit;
  String? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['variant_id'] = _variantId;
    map['unit'] = _unit;
    map['price'] = _price;
    return map;
  }

}