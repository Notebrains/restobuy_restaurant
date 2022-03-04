/// status : 1
/// message : "Requisitions and Save Requisitions List"
/// response : {"requisitions":[{"requisition_id":20,"requisitionid":"RQ00006","datetime":"24-01-2022 10:30 AM","save":0,"total_items":3},{"requisition_id":5,"requisitionid":"RQ00005","datetime":"10-01-2022 08:37 AM","save":1,"total_items":1},{"requisition_id":4,"requisitionid":"RQ00004","datetime":"10-01-2022 05:48 AM","save":0,"total_items":4},{"requisition_id":3,"requisitionid":"RQ00003","datetime":"10-01-2022 05:44 AM","save":0,"total_items":2},{"requisition_id":2,"requisitionid":"RQ00002","datetime":"13-10-2021 06:37 AM","save":1,"total_items":2}],"save_requisitions":[{"id":3,"requisition_id":5,"template":"Req 5","datetime":"24-01-2022 09:39 AM","total_items":1},{"id":1,"requisition_id":2,"template":"ABC","datetime":"10-01-2022 05:34 AM","total_items":2}]}

class RequisitionApiResModel {
  RequisitionApiResModel({
      int? status, 
      String? message, 
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  RequisitionApiResModel.fromJson(dynamic json) {
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

/// requisitions : [{"requisition_id":20,"requisitionid":"RQ00006","datetime":"24-01-2022 10:30 AM","save":0,"total_items":3},{"requisition_id":5,"requisitionid":"RQ00005","datetime":"10-01-2022 08:37 AM","save":1,"total_items":1},{"requisition_id":4,"requisitionid":"RQ00004","datetime":"10-01-2022 05:48 AM","save":0,"total_items":4},{"requisition_id":3,"requisitionid":"RQ00003","datetime":"10-01-2022 05:44 AM","save":0,"total_items":2},{"requisition_id":2,"requisitionid":"RQ00002","datetime":"13-10-2021 06:37 AM","save":1,"total_items":2}]
/// save_requisitions : [{"id":3,"requisition_id":5,"template":"Req 5","datetime":"24-01-2022 09:39 AM","total_items":1},{"id":1,"requisition_id":2,"template":"ABC","datetime":"10-01-2022 05:34 AM","total_items":2}]

class Response {
  Response({
      List<Requisitions>? requisitions, 
      List<Save_requisitions>? saveRequisitions,}){
    _requisitions = requisitions;
    _saveRequisitions = saveRequisitions;
}

  Response.fromJson(dynamic json) {
    if (json['requisitions'] != null) {
      _requisitions = [];
      json['requisitions'].forEach((v) {
        _requisitions?.add(Requisitions.fromJson(v));
      });
    }
    if (json['save_requisitions'] != null) {
      _saveRequisitions = [];
      json['save_requisitions'].forEach((v) {
        _saveRequisitions?.add(Save_requisitions.fromJson(v));
      });
    }
  }
  List<Requisitions>? _requisitions;
  List<Save_requisitions>? _saveRequisitions;

  List<Requisitions>? get requisitions => _requisitions;
  List<Save_requisitions>? get saveRequisitions => _saveRequisitions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_requisitions != null) {
      map['requisitions'] = _requisitions?.map((v) => v.toJson()).toList();
    }
    if (_saveRequisitions != null) {
      map['save_requisitions'] = _saveRequisitions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// requisition_id : 5
/// template : "Req 5"
/// datetime : "24-01-2022 09:39 AM"
/// total_items : 1

class Save_requisitions {
  Save_requisitions({
      int? id, 
      int? requisitionId, 
      String? template, 
      String? datetime, 
      int? totalItems,}){
    _id = id;
    _requisitionId = requisitionId;
    _template = template;
    _datetime = datetime;
    _totalItems = totalItems;
}

  Save_requisitions.fromJson(dynamic json) {
    _id = json['id'];
    _requisitionId = json['requisition_id'];
    _template = json['template'];
    _datetime = json['datetime'];
    _totalItems = json['total_items'];
  }
  int? _id;
  int? _requisitionId;
  String? _template;
  String? _datetime;
  int? _totalItems;

  int? get id => _id;
  int? get requisitionId => _requisitionId;
  String? get template => _template;
  String? get datetime => _datetime;
  int? get totalItems => _totalItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['requisition_id'] = _requisitionId;
    map['template'] = _template;
    map['datetime'] = _datetime;
    map['total_items'] = _totalItems;
    return map;
  }

}

/// requisition_id : 20
/// requisitionid : "RQ00006"
/// datetime : "24-01-2022 10:30 AM"
/// save : 0
/// total_items : 3

class Requisitions {
  Requisitions({
      int? requisitionId, 
      String? requisitionid, 
      String? datetime, 
      int? save, 
      int? delete,
      int? totalItems,}){
    _requisitionId = requisitionId;
    _requisitionid = requisitionid;
    _datetime = datetime;
    _save = save;
    _delete = delete;
    _totalItems = totalItems;
}

  Requisitions.fromJson(dynamic json) {
    _requisitionId = json['requisition_id'];
    _requisitionid = json['requisitionid'];
    _datetime = json['datetime'];
    _save = json['save'];
    _delete = json['delete'];
    _totalItems = json['total_items'];
  }
  int? _requisitionId;
  String? _requisitionid;
  String? _datetime;
  int? _save;
  int? _delete;
  int? _totalItems;

  int? get requisitionId => _requisitionId;
  String? get requisitionid => _requisitionid;
  String? get datetime => _datetime;
  int? get save => _save;
  int? get delete => _delete;
  int? get totalItems => _totalItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['requisition_id'] = _requisitionId;
    map['requisitionid'] = _requisitionid;
    map['datetime'] = _datetime;
    map['save'] = _save;
    map['delete'] = _delete;
    map['total_items'] = _totalItems;
    return map;
  }

}