/// status : 1
/// message : "Save Requisitions Product List"
/// response : {"requisitions_product":[{"requisition_id":8,"product_name":"Fruits","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/culture-2-1643263670.png","variant":"2kg","price":"$20","qty":"4","subtotal":80,"supplier":"Alam Food & Beverages"},{"requisition_id":7,"product_name":"Diary","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/img_1645684631.jpg","variant":"2","price":"$2255","qty":"5","subtotal":11275,"supplier":"Alam Food & Beverages"}],"pdffile":{"pdf":"http://www.africau.edu/images/default/sample.pdf"}}

class SaveRequisitionsDetailsApiResModel {
  SaveRequisitionsDetailsApiResModel({
      int? status, 
      String? message, 
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  SaveRequisitionsDetailsApiResModel.fromJson(dynamic json) {
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

/// requisitions_product : [{"requisition_id":8,"product_name":"Fruits","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/culture-2-1643263670.png","variant":"2kg","price":"$20","qty":"4","subtotal":80,"supplier":"Alam Food & Beverages"},{"requisition_id":7,"product_name":"Diary","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/img_1645684631.jpg","variant":"2","price":"$2255","qty":"5","subtotal":11275,"supplier":"Alam Food & Beverages"}]
/// pdffile : {"pdf":"http://www.africau.edu/images/default/sample.pdf"}

class Response {
  Response({
      List<RequisitionsProduct>? requisitionsProduct, 
      Pdffile? pdffile,}){
    _requisitionsProduct = requisitionsProduct;
    _pdffile = pdffile;
}

  Response.fromJson(dynamic json) {
    if (json['requisitions_product'] != null) {
      _requisitionsProduct = [];
      json['requisitions_product'].forEach((v) {
        _requisitionsProduct?.add(RequisitionsProduct.fromJson(v));
      });
    }
    _pdffile = json['pdffile'] != null ? Pdffile.fromJson(json['pdffile']) : null;
  }
  List<RequisitionsProduct>? _requisitionsProduct;
  Pdffile? _pdffile;

  List<RequisitionsProduct>? get requisitionsProduct => _requisitionsProduct;
  Pdffile? get pdffile => _pdffile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_requisitionsProduct != null) {
      map['requisitions_product'] = _requisitionsProduct?.map((v) => v.toJson()).toList();
    }
    if (_pdffile != null) {
      map['pdffile'] = _pdffile?.toJson();
    }
    return map;
  }

}

/// pdf : "http://www.africau.edu/images/default/sample.pdf"

class Pdffile {
  Pdffile({
      String? pdf,}){
    _pdf = pdf;
}

  Pdffile.fromJson(dynamic json) {
    _pdf = json['pdf'];
  }
  String? _pdf;

  String? get pdf => _pdf;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pdf'] = _pdf;
    return map;
  }

}

/// requisition_id : 8
/// product_name : "Fruits"
/// image : "https://mridayaitservices.com/demo/restobuy/uploads/product/culture-2-1643263670.png"
/// variant : "2kg"
/// price : "$20"
/// qty : "4"
/// subtotal : 80
/// supplier : "Alam Food & Beverages"

class RequisitionsProduct {
  RequisitionsProduct({
      int? requisitionId, 
      String? productName, 
      String? image, 
      String? variant, 
      String? price, 
      String? qty, 
      int? subtotal, 
      String? supplier,}){
    _requisitionId = requisitionId;
    _productName = productName;
    _image = image;
    _variant = variant;
    _price = price;
    _qty = qty;
    _subtotal = subtotal;
    _supplier = supplier;
}

  RequisitionsProduct.fromJson(dynamic json) {
    _requisitionId = json['requisition_id'];
    _productName = json['product_name'];
    _image = json['image'];
    _variant = json['variant'];
    _price = json['price'];
    _qty = json['qty'];
    _subtotal = json['subtotal'];
    _supplier = json['supplier'];
  }
  int? _requisitionId;
  String? _productName;
  String? _image;
  String? _variant;
  String? _price;
  String? _qty;
  int? _subtotal;
  String? _supplier;

  int? get requisitionId => _requisitionId;
  String? get productName => _productName;
  String? get image => _image;
  String? get variant => _variant;
  String? get price => _price;
  String? get qty => _qty;
  int? get subtotal => _subtotal;
  String? get supplier => _supplier;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['requisition_id'] = _requisitionId;
    map['product_name'] = _productName;
    map['image'] = _image;
    map['variant'] = _variant;
    map['price'] = _price;
    map['qty'] = _qty;
    map['subtotal'] = _subtotal;
    map['supplier'] = _supplier;
    return map;
  }

}