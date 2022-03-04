/// status : 1
/// message : "Invoice List"
/// response : [{"id":1,"invoice_id":"INV00001","invoice_amount":"$300","supplier_name":"Sudeep Food & Beverages","datetime":"10-01-2022 08:44 AM"}]

class InvoiceApiResModel {
  InvoiceApiResModel({
      int? status, 
      String? message, 
      List<Response>? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  InvoiceApiResModel.fromJson(dynamic json) {
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

/// id : 1
/// invoice_id : "INV00001"
/// invoice_amount : "$300"
/// supplier_name : "Sudeep Food & Beverages"
/// datetime : "10-01-2022 08:44 AM"

class Response {
  Response({
      int? id, 
      String? invoiceId, 
      String? invoiceAmount, 
      String? supplierName, 
      String? datetime,}){
    _id = id;
    _invoiceId = invoiceId;
    _invoiceAmount = invoiceAmount;
    _supplierName = supplierName;
    _datetime = datetime;
}

  Response.fromJson(dynamic json) {
    _id = json['id'];
    _invoiceId = json['invoice_id'];
    _invoiceAmount = json['invoice_amount'];
    _supplierName = json['supplier_name'];
    _datetime = json['datetime'];
  }
  int? _id;
  String? _invoiceId;
  String? _invoiceAmount;
  String? _supplierName;
  String? _datetime;

  int? get id => _id;
  String? get invoiceId => _invoiceId;
  String? get invoiceAmount => _invoiceAmount;
  String? get supplierName => _supplierName;
  String? get datetime => _datetime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['invoice_id'] = _invoiceId;
    map['invoice_amount'] = _invoiceAmount;
    map['supplier_name'] = _supplierName;
    map['datetime'] = _datetime;
    return map;
  }

}