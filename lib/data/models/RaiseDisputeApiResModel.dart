/// status : 1
/// message : "Supplier List and Ticket Id"
/// response : {"supplier":[{"supplier_id":10,"supplier_name":"Basuli Food Supply"},{"supplier_id":6,"supplier_name":"Alam Food & Beverages"},{"supplier_id":5,"supplier_name":"Sudeep Food & Beverages"}],"ticket_id":"TCKT00007"}

class RaiseDisputeApiResModel {
  RaiseDisputeApiResModel({
      int? status, 
      String? message, 
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  RaiseDisputeApiResModel.fromJson(dynamic json) {
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

/// supplier : [{"supplier_id":10,"supplier_name":"Basuli Food Supply"},{"supplier_id":6,"supplier_name":"Alam Food & Beverages"},{"supplier_id":5,"supplier_name":"Sudeep Food & Beverages"}]
/// ticket_id : "TCKT00007"

class Response {
  Response({
      List<Supplier>? supplier, 
      String? ticketId,}){
    _supplier = supplier;
    _ticketId = ticketId;
}

  Response.fromJson(dynamic json) {
    if (json['supplier'] != null) {
      _supplier = [];
      json['supplier'].forEach((v) {
        _supplier?.add(Supplier.fromJson(v));
      });
    }
    _ticketId = json['ticket_id'];
  }
  List<Supplier>? _supplier;
  String? _ticketId;

  List<Supplier>? get supplier => _supplier;
  String? get ticketId => _ticketId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_supplier != null) {
      map['supplier'] = _supplier?.map((v) => v.toJson()).toList();
    }
    map['ticket_id'] = _ticketId;
    return map;
  }

}

/// supplier_id : 10
/// supplier_name : "Basuli Food Supply"

class Supplier {
  Supplier({
      int? supplierId, 
      String? supplierName,}){
    _supplierId = supplierId;
    _supplierName = supplierName;
}

  Supplier.fromJson(dynamic json) {
    _supplierId = json['supplier_id'];
    _supplierName = json['supplier_name'];
  }
  int? _supplierId;
  String? _supplierName;

  int? get supplierId => _supplierId;
  String? get supplierName => _supplierName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['supplier_id'] = _supplierId;
    map['supplier_name'] = _supplierName;
    return map;
  }

}