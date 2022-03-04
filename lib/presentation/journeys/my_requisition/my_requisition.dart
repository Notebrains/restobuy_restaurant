import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:restobuy_restaurant_flutter/common/extensions/common_fun.dart';
import 'package:restobuy_restaurant_flutter/data/core/api_constants.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/api_functions.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/local_data_source_shared_preferences.dart';
import 'package:restobuy_restaurant_flutter/data/models/my_requisition_api_res_model.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/edge_alerts/edge_alerts.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/appbar_ic_back.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/bottom_sheet_qty_ui.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/button_sq_ic.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/cached_net_img_radius.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/lottie_loading.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/no_data_found.dart';

class MyRequisition extends StatefulWidget {
  const MyRequisition({Key? key}) : super(key: key);

  @override
  MyRequisitionState createState() {
    return MyRequisitionState();
  }
}

class MyRequisitionState extends State<MyRequisition> {
  final ValueNotifier<int> cartUpdateValueNotify = ValueNotifier<int>(0);
  int itemQty = 0;
  String customerId = '';
  String? userId = '';
  int bottomRadioValue = 0;

  late Future<bool> _future;
  late bool isApiDataAvailable = false;
  MyRequisitionApiResModel model = MyRequisitionApiResModel();
  String variant = 'Select';
  List<String> selectedItemValue = [];


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  Future<bool> getDataFromApi() async {
    try{
      userId = await MySharedPreferences().getUserId();

      Map<String, dynamic> body = {};
      body['user_id'] = userId;

      await ApiFun.apiPostWithBody(ApiConstants.cart, body).then((jsonDecodeData) => {
        model = MyRequisitionApiResModel.fromJson(jsonDecodeData),
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
    _future = getDataFromApi();

    return Scaffold(
      appBar: appBarIcBack(context, 'Cart'),
      backgroundColor: Colors.grey.shade200,
      body: FutureBuilder(
        future: _future,
        builder: (context, snapShot){
          if(snapShot.hasData && snapShot.connectionState == ConnectionState.done){
            if(isApiDataAvailable){
              saveCartCount(context, model.response?.products?.length);
              return cartUi(model.response?.products?? [], model.response?.total?? 0);
            } else {
              return NoDataFound(txt: 'No Requisition Added', onRefresh: (){},);
            }
          } else {
            return const LottieLoading();
          }
        },
      ),
    );
  }

  Widget cartUi(List<Products> response, int total) {
    return Stack(
      children: [
        Visibility(
            visible: response.isEmpty,
            child: NoDataFound(txt: 'Empty Requisition', onRefresh: (){},)),

        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 65, top: 10),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: response.length,
            itemBuilder: (context, index) {
              return SlideInLeft(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    border: Border.all(color: Colors.grey.shade50),
                  ),
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          margin: const EdgeInsets.only(right: 8),
                          child: cachedNetImgWithRadius(
                              response[index].image!, 100, 100, 5, BoxFit.cover
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                response[index].productName!,
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style: TextStyle( fontWeight: FontWeight.bold, fontSize: 14, color: Colors.amber.shade700),
                              ),
                            ),
                            Text(
                              '\$ ${response[index].subtotal!}',
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.black54),
                            ),

                            Text(
                              'Qty: ${response[index].qty!}',
                              textAlign: TextAlign.start,
                              style:
                              TextStyle( fontSize: 12, color: Colors.grey[600]),
                            ),

                            Text(
                              'Unit - ${response[index].variant!}',
                              textAlign: TextAlign.start,
                              style:
                              TextStyle(fontSize: 12, color: Colors.grey[600]),
                            ),

                            InkWell(
                              child: Container(
                                height: 25.0,
                                width: 100,
                                margin: const EdgeInsets.only(top: 3),
                                decoration: BoxDecoration(
                                  //color: Colors.blueAccent,
                                  border: Border.all(color: Colors.amber.withOpacity(0.5), width: 1.0),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: const Center(
                                  child: Text(
                                    ' Change Qty ',
                                    style: TextStyle(fontSize: 12.0, color: Colors.black54),
                                  ),
                                ),
                              ),
                              onTap: () {
                                showBottomSheetUi(context, (qty){
                                  changeItemQty( response[index].cartId.toString(), qty);
                                });
                              },
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: IconButton(
                            icon: const Icon(
                              Icons.delete_outline_rounded,
                              size: 25,
                              color: Colors.redAccent,
                            ),

                            onPressed: (){
                              deleteRequisition(response[index].cartId.toString());
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        Visibility(
          visible: response.isNotEmpty,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ButtonSqIc(
                      text: 'Total\n\$ $total',
                      size: 16,
                      icon: null,
                      txtColors: Colors.grey.shade700,
                      bgColors: Colors.grey.shade300,
                      icColors: Colors.amber,
                      onPressed: (){

                      },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ButtonSqIc(
                      text: 'Submit',
                      size: 16,
                      icon: null,
                      txtColors: Colors.black,
                      bgColors: Colors.amber.shade600,
                      icColors: Colors.white,
                      onPressed: () {
                        submitRequisition();
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void submitRequisition() async {
    try{
      showLoadingDialog(context);

      Map<String, dynamic> body = {};
      body['user_id'] = userId;

      await ApiFun.apiPostWithBody(ApiConstants.submitRequisitions, body).then((jsonDecodeData) {
        model = MyRequisitionApiResModel.fromJson(jsonDecodeData);
        edgeAlert(context, title: 'Message', description: model.message!);
      });

      if (model.status == 1) {
        saveCartCount(context, 0);
      }
      setState(() {});
    } catch(error){
      print("Error: $error");
    }
  }


  void deleteRequisition(String cartId) async {
    try{
      showLoadingDialog(context);

      Map<String, dynamic> body = {};
      body['cart_id'] = cartId;
      await ApiFun.apiPostWithBody(ApiConstants.deleteCartProduct, body).then((jsonDecodeData) {
        model = MyRequisitionApiResModel.fromJson(jsonDecodeData);
        edgeAlert(context, title: 'Message', description: model.message!);
      });

      if (model.status == 1) {
        saveCartCount(context, 0);
      }

      isApiDataAvailable = false;
      setState(() {});
    } catch(error){
      print("Error: $error");
    }
  }

  void changeItemQty(String cartId, String qty) async {
    try{
      showLoadingDialog(context);

      Map<String, dynamic> body = {};
      body['cart_id'] = cartId;
      body['qty'] = qty;

      await ApiFun.apiPostWithBody(ApiConstants.changeCartQty, body).then((jsonDecodeData) {
        model = MyRequisitionApiResModel.fromJson(jsonDecodeData);
        edgeAlert(context, title: 'Message', description: model.message!);
      });
      isApiDataAvailable = false;
      setState(() {});
    } catch(error){
      print("Error: $error");
    }
  }
}
