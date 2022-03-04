/// status : 1
/// message : "Product Orders List"
/// response : [{"purchase_order_id":4,"order_id":"PO00004","purchase_amount":"$300","supplier_name":"Sudeep Food & Beverages","datetime":"10-01-2022 08:43 AM","total_items":1},{"purchase_order_id":3,"order_id":"PO00003","purchase_amount":"$5200","supplier_name":"Sudeep Food & Beverages","datetime":"10-01-2022 05:52 AM","total_items":3},{"purchase_order_id":2,"order_id":"PO00002","purchase_amount":"$200","supplier_name":"Alam Food & Beverages","datetime":"07-10-2021 06:56 AM","total_items":1},{"purchase_order_id":1,"order_id":"PO00001","purchase_amount":"$4700","supplier_name":"Sudeep Food & Beverages","datetime":"07-10-2021 06:54 AM","total_items":4}]

class PurchaseOrderApiResModel {
  PurchaseOrderApiResModel({
      int? status, 
      String? message, 
      List<Response>? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  PurchaseOrderApiResModel.fromJson(dynamic json) {
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

/// purchase_order_id : 4
/// order_id : "PO00004"
/// purchase_amount : "$300"
/// supplier_name : "Sudeep Food & Beverages"
/// datetime : "10-01-2022 08:43 AM"
/// total_items : 1

class Response {
  Response({
      int? purchaseOrderId, 
      String? orderId, 
      String? purchaseAmount, 
      String? supplierName, 
      String? datetime, 
      int? totalItems,}){
    _purchaseOrderId = purchaseOrderId;
    _orderId = orderId;
    _purchaseAmount = purchaseAmount;
    _supplierName = supplierName;
    _datetime = datetime;
    _totalItems = totalItems;
}

  Response.fromJson(dynamic json) {
    _purchaseOrderId = json['purchase_order_id'];
    _orderId = json['order_id'];
    _purchaseAmount = json['purchase_amount'];
    _supplierName = json['supplier_name'];
    _datetime = json['datetime'];
    _totalItems = json['total_items'];
  }
  int? _purchaseOrderId;
  String? _orderId;
  String? _purchaseAmount;
  String? _supplierName;
  String? _datetime;
  int? _totalItems;

  int? get purchaseOrderId => _purchaseOrderId;
  String? get orderId => _orderId;
  String? get purchaseAmount => _purchaseAmount;
  String? get supplierName => _supplierName;
  String? get datetime => _datetime;
  int? get totalItems => _totalItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['purchase_order_id'] = _purchaseOrderId;
    map['order_id'] = _orderId;
    map['purchase_amount'] = _purchaseAmount;
    map['supplier_name'] = _supplierName;
    map['datetime'] = _datetime;
    map['total_items'] = _totalItems;
    return map;
  }

}