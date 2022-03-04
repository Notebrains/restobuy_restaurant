/// status : 1
/// message : "Product Details"
/// response : {"category_name":"Fruit & Vegetables","product_name":"Fruits and Vegitables","product_id":"PRD00003","price":"$50","rating":3,"totalrating":1,"special_notes":"","description":"<p>Fruits and Vegitables description</p>","images":[{"image":"https://mridayaitservices.com/demo/restobuy/uploads/product/download (2)-1629288288.jpg"}],"variant":[{"unit":"1 Kg","qty":"10","price":"50"},{"unit":"2 Kg","qty":"20","price":"100"}],"review":[{"date":"14-01-2022","user":"Ozora","rating":3,"review":"Good Product"}]}

class ProductDetailsApiResModel {
  ProductDetailsApiResModel({
      int? status, 
      String? message, 
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  ProductDetailsApiResModel.fromJson(dynamic json) {
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

/// category_name : "Fruit & Vegetables"
/// product_name : "Fruits and Vegitables"
/// product_id : "PRD00003"
/// price : "$50"
/// rating : 3
/// totalrating : 1
/// special_notes : ""
/// description : "<p>Fruits and Vegitables description</p>"
/// images : [{"image":"https://mridayaitservices.com/demo/restobuy/uploads/product/download (2)-1629288288.jpg"}]
/// variant : [{"unit":"1 Kg","qty":"10","price":"50"},{"unit":"2 Kg","qty":"20","price":"100"}]
/// review : [{"date":"14-01-2022","user":"Ozora","rating":3,"review":"Good Product"}]

class Response {
  Response({
      String? categoryName, 
      String? productName, 
      String? productId, 
      String? price, 
      int? rating, 
      int? totalrating, 
      String? specialNotes, 
      String? description, 
      List<Images>? images, 
      List<Variant>? variant, 
      List<Review>? review,}){
    _categoryName = categoryName;
    _productName = productName;
    _productId = productId;
    _price = price;
    _rating = rating;
    _totalrating = totalrating;
    _specialNotes = specialNotes;
    _description = description;
    _images = images;
    _variant = variant;
    _review = review;
}

  Response.fromJson(dynamic json) {
    _categoryName = json['category_name'];
    _productName = json['product_name'];
    _productId = json['product_id'];
    _price = json['price'];
    _rating = json['rating'];
    _totalrating = json['totalrating'];
    _specialNotes = json['special_notes'];
    _description = json['description'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
    if (json['variant'] != null) {
      _variant = [];
      json['variant'].forEach((v) {
        _variant?.add(Variant.fromJson(v));
      });
    }
    if (json['review'] != null) {
      _review = [];
      json['review'].forEach((v) {
        _review?.add(Review.fromJson(v));
      });
    }
  }
  String? _categoryName;
  String? _productName;
  String? _productId;
  String? _price;
  int? _rating;
  int? _totalrating;
  String? _specialNotes;
  String? _description;
  List<Images>? _images;
  List<Variant>? _variant;
  List<Review>? _review;

  String? get categoryName => _categoryName;
  String? get productName => _productName;
  String? get productId => _productId;
  String? get price => _price;
  int? get rating => _rating;
  int? get totalrating => _totalrating;
  String? get specialNotes => _specialNotes;
  String? get description => _description;
  List<Images>? get images => _images;
  List<Variant>? get variant => _variant;
  List<Review>? get review => _review;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_name'] = _categoryName;
    map['product_name'] = _productName;
    map['product_id'] = _productId;
    map['price'] = _price;
    map['rating'] = _rating;
    map['totalrating'] = _totalrating;
    map['special_notes'] = _specialNotes;
    map['description'] = _description;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    if (_variant != null) {
      map['variant'] = _variant?.map((v) => v.toJson()).toList();
    }
    if (_review != null) {
      map['review'] = _review?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// date : "14-01-2022"
/// user : "Ozora"
/// rating : 3
/// review : "Good Product"

class Review {
  Review({
      String? date, 
      String? user, 
      int? rating, 
      String? review,}){
    _date = date;
    _user = user;
    _rating = rating;
    _review = review;
}

  Review.fromJson(dynamic json) {
    _date = json['date'];
    _user = json['user'];
    _rating = json['rating'];
    _review = json['review'];
  }
  String? _date;
  String? _user;
  int? _rating;
  String? _review;

  String? get date => _date;
  String? get user => _user;
  int? get rating => _rating;
  String? get review => _review;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['user'] = _user;
    map['rating'] = _rating;
    map['review'] = _review;
    return map;
  }

}

/// unit : "1 Kg"
/// qty : "10"
/// price : "50"

class Variant {
  Variant({
      String? unit, 
      String? qty, 
      String? price,}){
    _unit = unit;
    _qty = qty;
    _price = price;
}

  Variant.fromJson(dynamic json) {
    _unit = json['unit'];
    _qty = json['qty'];
    _price = json['price'];
  }
  String? _unit;
  String? _qty;
  String? _price;

  String? get unit => _unit;
  String? get qty => _qty;
  String? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['unit'] = _unit;
    map['qty'] = _qty;
    map['price'] = _price;
    return map;
  }

}

/// image : "https://mridayaitservices.com/demo/restobuy/uploads/product/download (2)-1629288288.jpg"

class Images {
  Images({
      String? image,}){
    _image = image;
}

  Images.fromJson(dynamic json) {
    _image = json['image'];
  }
  String? _image;

  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    return map;
  }

}