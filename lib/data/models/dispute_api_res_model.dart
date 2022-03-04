/// status : 1
/// message : "Disputes List"
/// response : [{"dispute_id":1,"ticket_id":"TCKT00001","supplier_name":"Alam Food & Beverages","disputes_reason":"Reason Of Dispute"}]

class DisputeApiResModel {
  DisputeApiResModel({
      int? status, 
      String? message, 
      List<Response>? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  DisputeApiResModel.fromJson(dynamic json) {
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

/// dispute_id : 1
/// ticket_id : "TCKT00001"
/// supplier_name : "Alam Food & Beverages"
/// disputes_reason : "Reason Of Dispute"

class Response {
  Response({
      int? disputeId, 
      String? ticketId, 
      String? supplierName, 
      String? disputesReason,}){
    _disputeId = disputeId;
    _ticketId = ticketId;
    _supplierName = supplierName;
    _disputesReason = disputesReason;
}

  Response.fromJson(dynamic json) {
    _disputeId = json['dispute_id'];
    _ticketId = json['ticket_id'];
    _supplierName = json['supplier_name'];
    _disputesReason = json['disputes_reason'];
  }
  int? _disputeId;
  String? _ticketId;
  String? _supplierName;
  String? _disputesReason;

  int? get disputeId => _disputeId;
  String? get ticketId => _ticketId;
  String? get supplierName => _supplierName;
  String? get disputesReason => _disputesReason;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dispute_id'] = _disputeId;
    map['ticket_id'] = _ticketId;
    map['supplier_name'] = _supplierName;
    map['disputes_reason'] = _disputesReason;
    return map;
  }

}