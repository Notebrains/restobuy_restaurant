/// status : 1
/// message : "Requisitions and Save Requisitions Product List"
/// response : {"requisitions_product":[{"requisition_id":29,"product_name":"Fruits","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/culture-2-1643263670.png","variant":"2kg","price":"$20","qty":"5","subtotal":100,"supplier":"Alam Food & Beverages","status":"-"},{"requisition_id":26,"product_name":"Fruits and Vegitables","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/download (2)-1629288288.jpg","variant":"2 Kg","price":"$100","qty":"5","subtotal":500,"supplier":"Alam Food & Beverages","status":"-"}],"available_product":[{"requisition_id":27,"product_name":"Farm Quail Eggs","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/40094157_2-fresho-farm-quail-eggs-small-antibiotic-residue-free-1628492715.jpg","variant":"5 x 6 Pcs Multipack","price":"$400","qty":"2","subtotal":800,"supplier":"Sudeep Food & Beverages","status":"Available"}],"partially_available_product":[{"requisition_id":28,"product_name":"Mutton - Mince","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/fresho-mutton-mince-antibiotic-residue-free-growth-hormone-free-1628493230.jpg","variant":"1 Kg","price":"$800","qty":"6","approval_qty":"4","subtotal":4800,"supplier":"Sudeep Food & Beverages","status":"Partially Available"}],"unavailable_product":[{"requisition_id":31,"product_name":"Farm Quail Eggs","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/40094157_2-fresho-farm-quail-eggs-small-antibiotic-residue-free-1628492715.jpg","variant":"5 x 6 Pcs Multipack","price":"$400","qty":"5","approval_category_name":"Fruit & Vegetables","approval_product_name":"Fruits and Vegitables","approval_variant":"2 Kg","approval_qty":"2","subtotal":2000,"supplier":"Sudeep Food & Beverages","status":"Unavailable"}],"cancelled_product":[{"requisition_id":27,"product_name":"Farm Quail Eggs","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/40094157_2-fresho-farm-quail-eggs-small-antibiotic-residue-free-1628492715.jpg","variant":"5 x 6 Pcs Multipack","price":"$400","qty":"2","subtotal":800,"supplier":"Sudeep Food & Beverages","status":"Available"}],"save_requisitions_product":[{"requisition_id":16,"product_name":"Mutton - Mince","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/fresho-mutton-mince-antibiotic-residue-free-growth-hormone-free-1628493230.jpg","variant":"1 Kg","price":"$800","qty":"1","subtotal":800,"supplier":"Sudeep Food & Beverages"}],"pdffile":{"pdf":"http://www.africau.edu/images/default/sample.pdf"}}

class RequisitionDetailsApiResModel {
  RequisitionDetailsApiResModel({
      int? status, 
      String? message, 
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  RequisitionDetailsApiResModel.fromJson(dynamic json) {
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

/// requisitions_product : [{"requisition_id":29,"product_name":"Fruits","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/culture-2-1643263670.png","variant":"2kg","price":"$20","qty":"5","subtotal":100,"supplier":"Alam Food & Beverages","status":"-"},{"requisition_id":26,"product_name":"Fruits and Vegitables","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/download (2)-1629288288.jpg","variant":"2 Kg","price":"$100","qty":"5","subtotal":500,"supplier":"Alam Food & Beverages","status":"-"}]
/// available_product : [{"requisition_id":27,"product_name":"Farm Quail Eggs","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/40094157_2-fresho-farm-quail-eggs-small-antibiotic-residue-free-1628492715.jpg","variant":"5 x 6 Pcs Multipack","price":"$400","qty":"2","subtotal":800,"supplier":"Sudeep Food & Beverages","status":"Available"}]
/// partially_available_product : [{"requisition_id":28,"product_name":"Mutton - Mince","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/fresho-mutton-mince-antibiotic-residue-free-growth-hormone-free-1628493230.jpg","variant":"1 Kg","price":"$800","qty":"6","approval_qty":"4","subtotal":4800,"supplier":"Sudeep Food & Beverages","status":"Partially Available"}]
/// unavailable_product : [{"requisition_id":31,"product_name":"Farm Quail Eggs","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/40094157_2-fresho-farm-quail-eggs-small-antibiotic-residue-free-1628492715.jpg","variant":"5 x 6 Pcs Multipack","price":"$400","qty":"5","approval_category_name":"Fruit & Vegetables","approval_product_name":"Fruits and Vegitables","approval_variant":"2 Kg","approval_qty":"2","subtotal":2000,"supplier":"Sudeep Food & Beverages","status":"Unavailable"}]
/// cancelled_product : [{"requisition_id":27,"product_name":"Farm Quail Eggs","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/40094157_2-fresho-farm-quail-eggs-small-antibiotic-residue-free-1628492715.jpg","variant":"5 x 6 Pcs Multipack","price":"$400","qty":"2","subtotal":800,"supplier":"Sudeep Food & Beverages","status":"Available"}]
/// save_requisitions_product : [{"requisition_id":16,"product_name":"Mutton - Mince","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/fresho-mutton-mince-antibiotic-residue-free-growth-hormone-free-1628493230.jpg","variant":"1 Kg","price":"$800","qty":"1","subtotal":800,"supplier":"Sudeep Food & Beverages"}]
/// pdffile : {"pdf":"http://www.africau.edu/images/default/sample.pdf"}

class Response {
  Response({
      List<RequisitionsProduct>? requisitionsProduct, 
      List<AvailableProduct>? availableProduct, 
      List<PartiallyAvailableProduct>? partiallyAvailableProduct, 
      List<UnavailableProduct>? unavailableProduct, 
      List<CancelledProduct>? cancelledProduct, 
      List<SaveRequisitionsProduct>? saveRequisitionsProduct, 
      Pdffile? pdffile,}){
    _requisitionsProduct = requisitionsProduct;
    _availableProduct = availableProduct;
    _partiallyAvailableProduct = partiallyAvailableProduct;
    _unavailableProduct = unavailableProduct;
    _cancelledProduct = cancelledProduct;
    _saveRequisitionsProduct = saveRequisitionsProduct;
    _pdffile = pdffile;
}

  Response.fromJson(dynamic json) {
    if (json['requisitions_product'] != null) {
      _requisitionsProduct = [];
      json['requisitions_product'].forEach((v) {
        _requisitionsProduct?.add(RequisitionsProduct.fromJson(v));
      });
    }
    if (json['available_product'] != null) {
      _availableProduct = [];
      json['available_product'].forEach((v) {
        _availableProduct?.add(AvailableProduct.fromJson(v));
      });
    }
    if (json['partially_available_product'] != null) {
      _partiallyAvailableProduct = [];
      json['partially_available_product'].forEach((v) {
        _partiallyAvailableProduct?.add(PartiallyAvailableProduct.fromJson(v));
      });
    }
    if (json['unavailable_product'] != null) {
      _unavailableProduct = [];
      json['unavailable_product'].forEach((v) {
        _unavailableProduct?.add(UnavailableProduct.fromJson(v));
      });
    }
    if (json['cancelled_product'] != null) {
      _cancelledProduct = [];
      json['cancelled_product'].forEach((v) {
        _cancelledProduct?.add(CancelledProduct.fromJson(v));
      });
    }
    if (json['save_requisitions_product'] != null) {
      _saveRequisitionsProduct = [];
      json['save_requisitions_product'].forEach((v) {
        _saveRequisitionsProduct?.add(SaveRequisitionsProduct.fromJson(v));
      });
    }
    _pdffile = json['pdffile'] != null ? Pdffile.fromJson(json['pdffile']) : null;
  }
  List<RequisitionsProduct>? _requisitionsProduct;
  List<AvailableProduct>? _availableProduct;
  List<PartiallyAvailableProduct>? _partiallyAvailableProduct;
  List<UnavailableProduct>? _unavailableProduct;
  List<CancelledProduct>? _cancelledProduct;
  List<SaveRequisitionsProduct>? _saveRequisitionsProduct;
  Pdffile? _pdffile;

  List<RequisitionsProduct>? get requisitionsProduct => _requisitionsProduct;
  List<AvailableProduct>? get availableProduct => _availableProduct;
  List<PartiallyAvailableProduct>? get partiallyAvailableProduct => _partiallyAvailableProduct;
  List<UnavailableProduct>? get unavailableProduct => _unavailableProduct;
  List<CancelledProduct>? get cancelledProduct => _cancelledProduct;
  List<SaveRequisitionsProduct>? get saveRequisitionsProduct => _saveRequisitionsProduct;
  Pdffile? get pdffile => _pdffile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_requisitionsProduct != null) {
      map['requisitions_product'] = _requisitionsProduct?.map((v) => v.toJson()).toList();
    }
    if (_availableProduct != null) {
      map['available_product'] = _availableProduct?.map((v) => v.toJson()).toList();
    }
    if (_partiallyAvailableProduct != null) {
      map['partially_available_product'] = _partiallyAvailableProduct?.map((v) => v.toJson()).toList();
    }
    if (_unavailableProduct != null) {
      map['unavailable_product'] = _unavailableProduct?.map((v) => v.toJson()).toList();
    }
    if (_cancelledProduct != null) {
      map['cancelled_product'] = _cancelledProduct?.map((v) => v.toJson()).toList();
    }
    if (_saveRequisitionsProduct != null) {
      map['save_requisitions_product'] = _saveRequisitionsProduct?.map((v) => v.toJson()).toList();
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

/// requisition_id : 16
/// product_name : "Mutton - Mince"
/// image : "https://mridayaitservices.com/demo/restobuy/uploads/product/fresho-mutton-mince-antibiotic-residue-free-growth-hormone-free-1628493230.jpg"
/// variant : "1 Kg"
/// price : "$800"
/// qty : "1"
/// subtotal : 800
/// supplier : "Sudeep Food & Beverages"

class SaveRequisitionsProduct {
  SaveRequisitionsProduct({
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

  SaveRequisitionsProduct.fromJson(dynamic json) {
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

/// requisition_id : 27
/// product_name : "Farm Quail Eggs"
/// image : "https://mridayaitservices.com/demo/restobuy/uploads/product/40094157_2-fresho-farm-quail-eggs-small-antibiotic-residue-free-1628492715.jpg"
/// variant : "5 x 6 Pcs Multipack"
/// price : "$400"
/// qty : "2"
/// subtotal : 800
/// supplier : "Sudeep Food & Beverages"
/// status : "Available"

class CancelledProduct {
  CancelledProduct({
      int? requisitionId, 
      String? productName, 
      String? image, 
      String? variant, 
      String? price, 
      String? qty, 
      int? subtotal, 
      String? supplier, 
      String? status,}){
    _requisitionId = requisitionId;
    _productName = productName;
    _image = image;
    _variant = variant;
    _price = price;
    _qty = qty;
    _subtotal = subtotal;
    _supplier = supplier;
    _status = status;
}

  CancelledProduct.fromJson(dynamic json) {
    _requisitionId = json['requisition_id'];
    _productName = json['product_name'];
    _image = json['image'];
    _variant = json['variant'];
    _price = json['price'];
    _qty = json['qty'];
    _subtotal = json['subtotal'];
    _supplier = json['supplier'];
    _status = json['status'];
  }
  int? _requisitionId;
  String? _productName;
  String? _image;
  String? _variant;
  String? _price;
  String? _qty;
  int? _subtotal;
  String? _supplier;
  String? _status;

  int? get requisitionId => _requisitionId;
  String? get productName => _productName;
  String? get image => _image;
  String? get variant => _variant;
  String? get price => _price;
  String? get qty => _qty;
  int? get subtotal => _subtotal;
  String? get supplier => _supplier;
  String? get status => _status;

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
    map['status'] = _status;
    return map;
  }

}

/// requisition_id : 31
/// product_name : "Farm Quail Eggs"
/// image : "https://mridayaitservices.com/demo/restobuy/uploads/product/40094157_2-fresho-farm-quail-eggs-small-antibiotic-residue-free-1628492715.jpg"
/// variant : "5 x 6 Pcs Multipack"
/// price : "$400"
/// qty : "5"
/// approval_category_name : "Fruit & Vegetables"
/// approval_product_name : "Fruits and Vegitables"
/// approval_variant : "2 Kg"
/// approval_qty : "2"
/// subtotal : 2000
/// supplier : "Sudeep Food & Beverages"
/// status : "Unavailable"

class UnavailableProduct {
  UnavailableProduct({
      int? requisitionId, 
      String? productName, 
      String? image, 
      String? variant, 
      String? price, 
      String? qty, 
      String? approvalCategoryName, 
      String? approvalProductName, 
      String? approvalVariant, 
      String? approvalQty, 
      int? subtotal, 
      String? supplier, 
      String? status,}){
    _requisitionId = requisitionId;
    _productName = productName;
    _image = image;
    _variant = variant;
    _price = price;
    _qty = qty;
    _approvalCategoryName = approvalCategoryName;
    _approvalProductName = approvalProductName;
    _approvalVariant = approvalVariant;
    _approvalQty = approvalQty;
    _subtotal = subtotal;
    _supplier = supplier;
    _status = status;
}

  UnavailableProduct.fromJson(dynamic json) {
    _requisitionId = json['requisition_id'];
    _productName = json['product_name'];
    _image = json['image'];
    _variant = json['variant'];
    _price = json['price'];
    _qty = json['qty'];
    _approvalCategoryName = json['approval_category_name'];
    _approvalProductName = json['approval_product_name'];
    _approvalVariant = json['approval_variant'];
    _approvalQty = json['approval_qty'];
    _subtotal = json['subtotal'];
    _supplier = json['supplier'];
    _status = json['status'];
  }
  int? _requisitionId;
  String? _productName;
  String? _image;
  String? _variant;
  String? _price;
  String? _qty;
  String? _approvalCategoryName;
  String? _approvalProductName;
  String? _approvalVariant;
  String? _approvalQty;
  int? _subtotal;
  String? _supplier;
  String? _status;

  int? get requisitionId => _requisitionId;
  String? get productName => _productName;
  String? get image => _image;
  String? get variant => _variant;
  String? get price => _price;
  String? get qty => _qty;
  String? get approvalCategoryName => _approvalCategoryName;
  String? get approvalProductName => _approvalProductName;
  String? get approvalVariant => _approvalVariant;
  String? get approvalQty => _approvalQty;
  int? get subtotal => _subtotal;
  String? get supplier => _supplier;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['requisition_id'] = _requisitionId;
    map['product_name'] = _productName;
    map['image'] = _image;
    map['variant'] = _variant;
    map['price'] = _price;
    map['qty'] = _qty;
    map['approval_category_name'] = _approvalCategoryName;
    map['approval_product_name'] = _approvalProductName;
    map['approval_variant'] = _approvalVariant;
    map['approval_qty'] = _approvalQty;
    map['subtotal'] = _subtotal;
    map['supplier'] = _supplier;
    map['status'] = _status;
    return map;
  }

}

/// requisition_id : 28
/// product_name : "Mutton - Mince"
/// image : "https://mridayaitservices.com/demo/restobuy/uploads/product/fresho-mutton-mince-antibiotic-residue-free-growth-hormone-free-1628493230.jpg"
/// variant : "1 Kg"
/// price : "$800"
/// qty : "6"
/// approval_qty : "4"
/// subtotal : 4800
/// supplier : "Sudeep Food & Beverages"
/// status : "Partially Available"

class PartiallyAvailableProduct {
  PartiallyAvailableProduct({
      int? requisitionId, 
      String? productName, 
      String? image, 
      String? variant, 
      String? price, 
      String? qty, 
      String? approvalQty, 
      int? subtotal, 
      String? supplier, 
      String? status,}){
    _requisitionId = requisitionId;
    _productName = productName;
    _image = image;
    _variant = variant;
    _price = price;
    _qty = qty;
    _approvalQty = approvalQty;
    _subtotal = subtotal;
    _supplier = supplier;
    _status = status;
}

  PartiallyAvailableProduct.fromJson(dynamic json) {
    _requisitionId = json['requisition_id'];
    _productName = json['product_name'];
    _image = json['image'];
    _variant = json['variant'];
    _price = json['price'];
    _qty = json['qty'];
    _approvalQty = json['approval_qty'];
    _subtotal = json['subtotal'];
    _supplier = json['supplier'];
    _status = json['status'];
  }
  int? _requisitionId;
  String? _productName;
  String? _image;
  String? _variant;
  String? _price;
  String? _qty;
  String? _approvalQty;
  int? _subtotal;
  String? _supplier;
  String? _status;

  int? get requisitionId => _requisitionId;
  String? get productName => _productName;
  String? get image => _image;
  String? get variant => _variant;
  String? get price => _price;
  String? get qty => _qty;
  String? get approvalQty => _approvalQty;
  int? get subtotal => _subtotal;
  String? get supplier => _supplier;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['requisition_id'] = _requisitionId;
    map['product_name'] = _productName;
    map['image'] = _image;
    map['variant'] = _variant;
    map['price'] = _price;
    map['qty'] = _qty;
    map['approval_qty'] = _approvalQty;
    map['subtotal'] = _subtotal;
    map['supplier'] = _supplier;
    map['status'] = _status;
    return map;
  }

}

/// requisition_id : 27
/// product_name : "Farm Quail Eggs"
/// image : "https://mridayaitservices.com/demo/restobuy/uploads/product/40094157_2-fresho-farm-quail-eggs-small-antibiotic-residue-free-1628492715.jpg"
/// variant : "5 x 6 Pcs Multipack"
/// price : "$400"
/// qty : "2"
/// subtotal : 800
/// supplier : "Sudeep Food & Beverages"
/// status : "Available"

class AvailableProduct {
  AvailableProduct({
      int? requisitionId, 
      String? productName, 
      String? image, 
      String? variant, 
      String? price, 
      String? qty, 
      int? subtotal, 
      String? supplier, 
      String? status,}){
    _requisitionId = requisitionId;
    _productName = productName;
    _image = image;
    _variant = variant;
    _price = price;
    _qty = qty;
    _subtotal = subtotal;
    _supplier = supplier;
    _status = status;
}

  AvailableProduct.fromJson(dynamic json) {
    _requisitionId = json['requisition_id'];
    _productName = json['product_name'];
    _image = json['image'];
    _variant = json['variant'];
    _price = json['price'];
    _qty = json['qty'];
    _subtotal = json['subtotal'];
    _supplier = json['supplier'];
    _status = json['status'];
  }
  int? _requisitionId;
  String? _productName;
  String? _image;
  String? _variant;
  String? _price;
  String? _qty;
  int? _subtotal;
  String? _supplier;
  String? _status;

  int? get requisitionId => _requisitionId;
  String? get productName => _productName;
  String? get image => _image;
  String? get variant => _variant;
  String? get price => _price;
  String? get qty => _qty;
  int? get subtotal => _subtotal;
  String? get supplier => _supplier;
  String? get status => _status;

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
    map['status'] = _status;
    return map;
  }

}

/// requisition_id : 29
/// product_name : "Fruits"
/// image : "https://mridayaitservices.com/demo/restobuy/uploads/product/culture-2-1643263670.png"
/// variant : "2kg"
/// price : "$20"
/// qty : "5"
/// subtotal : 100
/// supplier : "Alam Food & Beverages"
/// status : "-"

class RequisitionsProduct {
  RequisitionsProduct({
      int? requisitionId, 
      String? productName, 
      String? image, 
      String? variant, 
      String? price, 
      String? qty, 
      int? subtotal, 
      String? supplier, 
      String? status,}){
    _requisitionId = requisitionId;
    _productName = productName;
    _image = image;
    _variant = variant;
    _price = price;
    _qty = qty;
    _subtotal = subtotal;
    _supplier = supplier;
    _status = status;
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
    _status = json['status'];
  }
  int? _requisitionId;
  String? _productName;
  String? _image;
  String? _variant;
  String? _price;
  String? _qty;
  int? _subtotal;
  String? _supplier;
  String? _status;

  int? get requisitionId => _requisitionId;
  String? get productName => _productName;
  String? get image => _image;
  String? get variant => _variant;
  String? get price => _price;
  String? get qty => _qty;
  int? get subtotal => _subtotal;
  String? get supplier => _supplier;
  String? get status => _status;

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
    map['status'] = _status;
    return map;
  }

}