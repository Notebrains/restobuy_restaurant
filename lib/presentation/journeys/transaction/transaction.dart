
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:lottie/lottie.dart';
import 'package:restobuy_restaurant_flutter/common/constants/route_constants.dart';
import 'package:restobuy_restaurant_flutter/data/core/api_constants.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/api_functions.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/local_data_source_shared_preferences.dart';
import 'package:restobuy_restaurant_flutter/data/models/transaction_api_res_model.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/my_requisition/custom_app_bar.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/lottie_loading.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/no_data_found.dart';

import 'transaction_list_widget.dart';


class Transaction extends StatefulWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Transaction> {
  late Future<bool> _future;
  late bool isApiDataAvailable = false;
  TransactionApiResModel model = TransactionApiResModel();

  @override
  void initState() {
    super.initState();

    _future = getDataFromApi();
  }


  Future<bool> getDataFromApi() async {
    try{
      String? userId = await MySharedPreferences().getUserId();
      Map<String, dynamic> body = {};
      body["user_id"] = userId;

      await ApiFun.apiPostWithBody(ApiConstants.transaction, body).then((jsonDecodeData) => {
        model = TransactionApiResModel.fromJson(jsonDecodeData),
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
      appBar: CustomAppBar(context: context, title: 'Transaction'),
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
        future: _future,
        builder: (context, snapShot){
          if(snapShot.hasData){
            if(isApiDataAvailable){
              return SlideInUp(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12, top: 8),
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: model.response?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TransactionListWidget(
                          response: model.response!,
                          index: index,
                          onTapOnList: (intValue){
                            //Navigator.of(context).pushNamed(RouteList.purchase_order_details);
                          },
                          onRefreshed: () {

                          },
                        );
                      }),
                ),
              );
            }
            else { return NoDataFound(txt: 'No Transaction To Show', onRefresh: (){});}
          } else {
            return const LottieLoading();
          }
        },
      ),
    );
  }
}
