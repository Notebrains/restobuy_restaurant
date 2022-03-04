import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:restobuy_restaurant_flutter/common/extensions/common_fun.dart';
import 'package:restobuy_restaurant_flutter/data/core/api_constants.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/api_functions.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/local_data_source_shared_preferences.dart';
import 'package:restobuy_restaurant_flutter/data/models/invoice_api_res_model.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/invoice_details/invoice_details.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/my_requisition/custom_app_bar.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/filter_date_sort.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/lottie_loading.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/no_data_found.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt_ic_row.dart';

import 'invoice_list_widget.dart';

class Invoice extends StatefulWidget {

  const Invoice({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Invoice> {
  TextEditingController controller = TextEditingController();
  late List<String> listData = [];

  late Future<bool> _future;
  late bool isApiDataAvailable = false;
  InvoiceApiResModel model = InvoiceApiResModel();


  @override
  void initState() {
    super.initState();

    _future = getDataFromApi('','','');
  }

  @override
  void dispose() {
    super.dispose();
  }


  Future<bool> getDataFromApi(String fromDateStr, String toDateStr, String sortStr) async {
    try{
      String? userId = await MySharedPreferences().getUserId();
      Map<String, dynamic> body = {};
      body['user_id'] = userId;
      body['sort'] = sortStr == 'Ascending'? 'asc': 'desc'; // asc, desc
      body['from_date'] = fromDateStr;
      body['to_date'] = toDateStr;

      await ApiFun.apiPostWithBody(ApiConstants.invoice, body).then((jsonDecodeData) => {
        model = InvoiceApiResModel.fromJson(jsonDecodeData),
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
      appBar: CustomAppBar(context: context, title: 'Invoice'),
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          FilterDateSort(onTap: (fromDateString, toDateString, sortString){
            if (kDebugMode) {
              print('---- : $fromDateString, $toDateString, $sortString');
            }
            setState(() {
              isApiDataAvailable = false;
              _future = getDataFromApi(fromDateString, toDateString, sortString);
            });
          }),

          FutureBuilder(
            future: _future,
            builder: (context, snapShot){
              if(snapShot.hasData && snapShot.connectionState == ConnectionState.done){
                if(isApiDataAvailable){
                  return Expanded(
                      child: SlideInUp(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: model.response!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InvoiceListWidget(
                                  response: model.response!,
                                  index: index,
                                  onTapOnList: (index) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) => InvoiceDetails(invoiceId: model.response![index].id.toString()),
                                      ),
                                    );
                                  },
                                  onRefreshed: () {

                                  },
                                );
                              }),
                        ),
                      ),
                  );
              }
              else {return NoDataFound(txt: 'No invoice to show', onRefresh:(){});}
              } else { return const LottieLoading();}
            },
          ),


        ],
      ),
    );
  }
}
