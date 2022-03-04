/// status : 1
/// message : "Review List"
/// response : [{"review_id":1,"product_name":"Farm Quail Eggs","rating":"4","review":"Excellent","review_by":"Ozora"}]

class ReviewApiResModel {
  ReviewApiResModel({
      int? status, 
      String? message, 
      List<Response>? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  ReviewApiResModel.fromJson(dynamic json) {
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

/// review_id : 1
/// product_name : "Farm Quail Eggs"
/// rating : "4"
/// review : "Excellent"
/// review_by : "Ozora"

class Response {
  Response({
      int? reviewId, 
      String? productName, 
      int? rating,
      String? review, 
      String? reviewBy,}){
    _reviewId = reviewId;
    _productName = productName;
    _rating = rating;
    _review = review;
    _reviewBy = reviewBy;
}

  Response.fromJson(dynamic json) {
    _reviewId = json['review_id'];
    _productName = json['product_name'];
    _rating = json['rating'];
    _review = json['review'];
    _reviewBy = json['review_by'];
  }
  int? _reviewId;
  String? _productName;
  int? _rating;
  String? _review;
  String? _reviewBy;

  int? get reviewId => _reviewId;
  String? get productName => _productName;
  int? get rating => _rating;
  String? get review => _review;
  String? get reviewBy => _reviewBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['review_id'] = _reviewId;
    map['product_name'] = _productName;
    map['rating'] = _rating;
    map['review'] = _review;
    map['review_by'] = _reviewBy;
    return map;
  }

}