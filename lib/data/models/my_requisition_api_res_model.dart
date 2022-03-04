/// status : 1
/// message : "Cart Product List"
/// response : {"products":[{"cart_id":77,"product_name":"Mutton - Mince","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/fresho-mutton-mince-antibiotic-residue-free-growth-hormone-free-1628493230.jpg","description":"<p>Mutton is popular in most of the household. It is treated as a delicacy and is prepared in different joyous occasions. The juicy taste and the chewy texture make it a favourite among many. Moreover, they come with a lot of health benefits. It is packed with protein, saturated fat, iron, zinc and B vitamins. \r\n\r\nLooking for a little cooking adventure? </p><p><br></p><p>This minced mutton from Fresho will surely take out the chef in you. Get creative with your culinary talent with this perfectly chopped boneless mutton pieces. From your favourite subs to Indian keema, enjoy delicious dishes with Fresho minced Mutton. The quantity is perfect for 3-4 people. </p>","variant":"5 Kg","price":"3500","qty":"2","subtotal":7000},{"cart_id":80,"product_name":"Farm Quail Eggs","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/40094157_2-fresho-farm-quail-eggs-small-antibiotic-residue-free-1628492715.jpg","description":"<p>Though smaller in size than chicken eggs, quail eggs contain more fat, protein, iron, and vitamin. It is packed with health-promoting antioxidants helping in cellular damage. It is a delicacy in different Asian countries like Indonesia, Japan, and South Korea. There are a variety of dishes one can cook with this egg. </p><p><br></p><p>\r\n\r\nThe Add-on Benefits of Fresho Egg:\r\n\r\n</p><ul>\r\n<li>Antibiotic free</li>\r\n<li>Free from growth hormones </li>\r\n<li>Carefully selected</li>\r\n</ul>","variant":"4 x 6 Pcs Multipack","price":"300","qty":"2","subtotal":600}],"total":7600}

class MyRequisitionApiResModel {
  MyRequisitionApiResModel({
      int? status, 
      String? message, 
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  MyRequisitionApiResModel.fromJson(dynamic json) {
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

/// products : [{"cart_id":77,"product_name":"Mutton - Mince","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/fresho-mutton-mince-antibiotic-residue-free-growth-hormone-free-1628493230.jpg","description":"<p>Mutton is popular in most of the household. It is treated as a delicacy and is prepared in different joyous occasions. The juicy taste and the chewy texture make it a favourite among many. Moreover, they come with a lot of health benefits. It is packed with protein, saturated fat, iron, zinc and B vitamins. \r\n\r\nLooking for a little cooking adventure? </p><p><br></p><p>This minced mutton from Fresho will surely take out the chef in you. Get creative with your culinary talent with this perfectly chopped boneless mutton pieces. From your favourite subs to Indian keema, enjoy delicious dishes with Fresho minced Mutton. The quantity is perfect for 3-4 people. </p>","variant":"5 Kg","price":"3500","qty":"2","subtotal":7000},{"cart_id":80,"product_name":"Farm Quail Eggs","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/40094157_2-fresho-farm-quail-eggs-small-antibiotic-residue-free-1628492715.jpg","description":"<p>Though smaller in size than chicken eggs, quail eggs contain more fat, protein, iron, and vitamin. It is packed with health-promoting antioxidants helping in cellular damage. It is a delicacy in different Asian countries like Indonesia, Japan, and South Korea. There are a variety of dishes one can cook with this egg. </p><p><br></p><p>\r\n\r\nThe Add-on Benefits of Fresho Egg:\r\n\r\n</p><ul>\r\n<li>Antibiotic free</li>\r\n<li>Free from growth hormones </li>\r\n<li>Carefully selected</li>\r\n</ul>","variant":"4 x 6 Pcs Multipack","price":"300","qty":"2","subtotal":600}]
/// total : 7600

class Response {
  Response({
      List<Products>? products, 
      int? total,}){
    _products = products;
    _total = total;
}

  Response.fromJson(dynamic json) {
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
    _total = json['total'];
  }
  List<Products>? _products;
  int? _total;

  List<Products>? get products => _products;
  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['total'] = _total;
    return map;
  }

}

/// cart_id : 77
/// product_name : "Mutton - Mince"
/// image : "https://mridayaitservices.com/demo/restobuy/uploads/product/fresho-mutton-mince-antibiotic-residue-free-growth-hormone-free-1628493230.jpg"
/// description : "<p>Mutton is popular in most of the household. It is treated as a delicacy and is prepared in different joyous occasions. The juicy taste and the chewy texture make it a favourite among many. Moreover, they come with a lot of health benefits. It is packed with protein, saturated fat, iron, zinc and B vitamins. \r\n\r\nLooking for a little cooking adventure? </p><p><br></p><p>This minced mutton from Fresho will surely take out the chef in you. Get creative with your culinary talent with this perfectly chopped boneless mutton pieces. From your favourite subs to Indian keema, enjoy delicious dishes with Fresho minced Mutton. The quantity is perfect for 3-4 people. </p>"
/// variant : "5 Kg"
/// price : "3500"
/// qty : "2"
/// subtotal : 7000

class Products {
  Products({
      int? cartId, 
      String? productName, 
      String? image, 
      String? description, 
      String? variant, 
      String? price, 
      String? qty, 
      int? subtotal,}){
    _cartId = cartId;
    _productName = productName;
    _image = image;
    _description = description;
    _variant = variant;
    _price = price;
    _qty = qty;
    _subtotal = subtotal;
}

  Products.fromJson(dynamic json) {
    _cartId = json['cart_id'];
    _productName = json['product_name'];
    _image = json['image'];
    _description = json['description'];
    _variant = json['variant'];
    _price = json['price'];
    _qty = json['qty'];
    _subtotal = json['subtotal'];
  }
  int? _cartId;
  String? _productName;
  String? _image;
  String? _description;
  String? _variant;
  String? _price;
  String? _qty;
  int? _subtotal;

  int? get cartId => _cartId;
  String? get productName => _productName;
  String? get image => _image;
  String? get description => _description;
  String? get variant => _variant;
  String? get price => _price;
  String? get qty => _qty;
  int? get subtotal => _subtotal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cart_id'] = _cartId;
    map['product_name'] = _productName;
    map['image'] = _image;
    map['description'] = _description;
    map['variant'] = _variant;
    map['price'] = _price;
    map['qty'] = _qty;
    map['subtotal'] = _subtotal;
    return map;
  }

}