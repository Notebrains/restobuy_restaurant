import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:restobuy_restaurant_flutter/common/extensions/common_fun.dart';
import 'package:restobuy_restaurant_flutter/common/screenutil/screenutil.dart';
import 'package:restobuy_restaurant_flutter/data/core/api_constants.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/api_functions.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/local_data_source_shared_preferences.dart';
import 'package:restobuy_restaurant_flutter/data/models/CartAddProductApiResModel.dart';
import 'package:restobuy_restaurant_flutter/data/models/product_api_res_model.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/my_requisition/custom_app_bar.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/product_details/product_details.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/edge_alerts/edge_alerts.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/star_rating.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/cached_net_img_top_radius.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/lottie_loading.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/no_data_found.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt.dart';

class Product extends StatefulWidget{
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  late Future<bool> _future;
  late bool isApiDataAvailable = false;
  ProductApiResModel model = ProductApiResModel();
  String variant = 'Select';
  String selectedVariant = '';
  List<String> selectedItemValue = [];


  @override
  void initState() {
    super.initState();
    _future = getDataFromApi();
  }

  @override
  void dispose() {
    super.dispose();
  }


  Future<bool> getDataFromApi() async {
    try{
      //String? userId = await MySharedPreferences().getUserId();

      await ApiFun.apiPostWithoutBody(ApiConstants.product).then((jsonDecodeData) => {
        model = ProductApiResModel.fromJson(jsonDecodeData),
      });

      if(model.status == 1) {
        isApiDataAvailable = true;
      }
    } catch(error){
      print("Error: $error");
    }
    return isApiDataAvailable;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(context: context, title: 'Product'),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapShot){
          if(snapShot.hasData){
            if(isApiDataAvailable){
              return SlideInUp(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: GridView.count(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 0.61,
                    // crossAxisSpacing: 1.0,
                    mainAxisSpacing: 4.0,
                    children: List.generate(model.response!.length, (index) {
                      TextEditingController? _cartCountController = TextEditingController();
                      for (int i = 0; i < model.response!.length; i++) {
                        selectedItemValue.add("Select");
                      }

                      return InkWell(
                        child: Card(
                          elevation: 8,
                          color: Colors.white,
                          margin: const EdgeInsets.all(6),
                          shadowColor: Colors.grey.withOpacity(0.4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              cachedNetImgWithCustomRadius(model.response![index].image!.toString(), 200, 110, 5, BoxFit.cover),

                              Padding(
                                padding: const EdgeInsets.only(left: 5, top: 6),
                                child: Txt(txt: model.response![index].productName!.toString(), txtColor: Colors.black, txtSize: 14, fontWeight: FontWeight.bold,
                                  padding: 0,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 5, top: 2, bottom: 2),
                                //child: StarRating(rating: model.response![index].rating! as double,
                                child: StarRating(rating: model.response![index].rating!.toDouble(),
                                    onRatingChanged: (rating){}, color: Colors.amber.shade900, iconSize: 16),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Txt(txt: model.response![index].price!.toString(), txtColor: Colors.amber.shade900, txtSize: 12,
                                  fontWeight: FontWeight.normal, padding: 0,
                                ),
                              ),

                              Container(
                                  height: 30,
                                  margin: const EdgeInsets.fromLTRB(5, 8, 0, 0),
                                  padding: const EdgeInsets.only(left: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(color: Colors.grey.shade300),
                                  ),
                                  child: DropdownButton(
                                    underline: Container(),
                                    value: selectedItemValue[index].toString(),
                                    items: _dropDownItem(model.response![index].variant!),
                                    onChanged: (value) {
                                      selectedItemValue[index] = value.toString();

                                      if (kDebugMode) {
                                        print('----Variant : $value');
                                      }
                                      setState(() {
                                        selectedVariant = value.toString();
                                      });
                                    },
                                    hint: const Text('Select'),
                                  )
                              ),

                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Txt(txt: '  Qty ', txtColor: Colors.black, txtSize: 12, fontWeight: FontWeight.normal,
                                      padding: 0,
                                    ),

                                    Container(
                                      height: 25,
                                      width: ScreenUtil.screenWidth/3.32,
                                      margin: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                                      child: TextFormField(
                                        controller: _cartCountController,
                                        style: const TextStyle(fontSize: 13,color: Colors.black87),
                                        autocorrect: true,
                                        keyboardType: TextInputType.number,
                                        //validator: validator,
                                        //onSaved: onSaved,
                                        decoration: InputDecoration(
                                          hintText: '01',
                                          hintStyle: const TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding: const EdgeInsets.only(left: 8),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                                            borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                                          ),
                                          focusedBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(3.0)),
                                            borderSide: BorderSide(color: Colors.amber, width: 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              InkWell(
                                child: Container(
                                  height: 30,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
                                  ),
                                  child:  const Text(
                                    'Add +',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                    ),
                                  ),
                                ),

                                onTap: () async {
                                  // print('---- cartCount: ${_cartCountController.text}');
                                  if (selectedVariant.isEmpty) {
                                    edgeAlert(context, title: "Warning", description: 'Please select variable');
                                  } else if (_cartCountController.text.isEmpty) {
                                    edgeAlert(context, title: 'Message', description: 'Please enter quantity');
                                  } else {
                                    addToCart(model.response![index].productId.toString(), selectedVariant, _cartCountController.text);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProductDetails(productId: model.response![index].productId.toString())),
                          );
                        },
                      );
                    }),
                  ),
                ),
              );
            }
            else {return NoDataFound(txt: 'No product found', onRefresh: (){});}
          } else {
            return const LottieLoading();
          }
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> _dropDownItem(List<Variant> variantList) {
    List<String> itemList = [];
    var itemIdList = [''];
    //variant = itemList[0];
    itemList.add(variant);

    for(int i=0; i< variantList.length; i++){
      itemList.add(variantList[i].unit!);
      itemIdList.add(variantList[i].variantId!.toString());
    }

    return itemList.map((value) => DropdownMenuItem(
      value: value,
      child: SizedBox(
          width: 120,
          child: Text(value, style: const TextStyle(fontSize: 13, color: Colors.black54),)),
    )).toList();
  }

  void addToCart(String productId, String variant, String qty) async {
    try{
      showLoadingDialog(context);
      String? userId = await MySharedPreferences().getUserId();
      int? count = await MySharedPreferences().getCartItemCount();

      Map<String, dynamic> body = {};
      body['user_id'] = userId;
      body['product_id'] = productId;
      body['variant'] = variant;
      body['qty'] = qty;


      if (kDebugMode) {
        print('---- productId variant qty: $userId, $productId, $variant, $qty');
      }

      await ApiFun.apiPostWithBody(ApiConstants.cartAddProduct, body).then((jsonDecodeData) {
        CartAddProductApiResModel statusMessageApiResModel = CartAddProductApiResModel.fromJson(jsonDecodeData);
        edgeAlert(context, title: 'Message', description: statusMessageApiResModel.message!);
        if (statusMessageApiResModel.status == 1 && count != null) {
          count = (count! + 1);
          saveCartCount(context, count);
        }
      });
    } catch(error){
      print("Error: $error");
    }
  }
}