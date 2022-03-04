import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restobuy_restaurant_flutter/common/extensions/common_fun.dart';
import 'package:restobuy_restaurant_flutter/data/core/api_constants.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/api_functions.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/local_data_source_shared_preferences.dart';
import 'package:restobuy_restaurant_flutter/data/models/RequisitionDetailsApiResModel.dart';
import 'package:restobuy_restaurant_flutter/data/models/status_message_api_res_model.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/my_requisition/custom_app_bar.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/custom_tab_view.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/drop_down_input.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/drop_down_statefull_dialog.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/edge_alerts/edge_alerts.dart';
import 'package:restobuy_restaurant_flutter/presentation/themes/theme_color.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/button.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/cached_net_img_radius.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/dialog_unavailable.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/lottie_loading.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/no_data_found.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt.dart';


class ViewRequisition extends StatefulWidget {
  final String requisitionId;

  const ViewRequisition({Key? key, required this.requisitionId}) : super(key: key);

  @override
  _ViewRequisitionState createState() => _ViewRequisitionState();
}

class _ViewRequisitionState extends State<ViewRequisition> {
  List<String> tabBarList = ['Product', 'Available', 'Partially Available', 'Unavailable', 'Cancelled',];
  int initPosition = 0;

  List<dynamic> dataList = [];
  //List<Save_requisitions_product> savedRequisitionList = [];

  late Future<bool> _future;

  late bool isApiDataAvailable = false;

  RequisitionDetailsApiResModel model = RequisitionDetailsApiResModel();

  String variant = 'Select';

  List<String> selectedItemValue = [];

  @override
  void initState() {
    super.initState();
    _future = getDataFromApi();
  }

  Future<bool> getDataFromApi() async {
    try{
      Map<String, dynamic> body = {};
      body['requisition_id'] = widget.requisitionId;

      await ApiFun.apiPostWithBody(ApiConstants.requisitionProduct, body).then((jsonDecodeData) => {
        model = RequisitionDetailsApiResModel.fromJson(jsonDecodeData),
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
      backgroundColor: Colors.grey[100],
      appBar: CustomAppBar(context: context, title: 'Info'),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapShot){
          if(snapShot.hasData && snapShot.connectionState == ConnectionState.done){
            if(isApiDataAvailable){
              return  CustomTabView(
                initPosition: initPosition,
                itemCount: tabBarList.length,
                tabBuilder: (context, index) => Tab(
                  height: 53,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 5, top: 12,),
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(color: Colors.amber.shade700, width: 0.5),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade300,
                            blurRadius: 6,
                          )
                        ]
                    ),

                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, top: 3, bottom: 3),
                      child: Text(getTabTitle(index),
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: AppColor.grey, fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
                onPositionChange: (index){
                  //print('current position: $index');
                  initPosition = index;
                },
                onScroll: (position) => print('$position'),
                //Stub will show if widget length < 1
                stub: Container(),
                pageBuilder: (context, index) => buildListUi(dataList, index),
              );
            }
            else {return NoDataFound(txt: 'No requisition found', onRefresh: (){});}
          } else {
            return const LottieLoading();
          }
        },
      ),
    );
  }


  Widget buildListUi(List<dynamic> dataList, int index) {
    if (index == 0) {
      dataList = model.response!.requisitionsProduct ?? [];
    } else if (index == 1) {
      dataList = model.response!.availableProduct ?? [];
    } else if (index == 2) {
      dataList = model.response!.partiallyAvailableProduct ?? [];
    } else if (index == 3) {
      dataList = model.response!.unavailableProduct ?? [];
    } else if (index == 4) {
      dataList = model.response!.cancelledProduct ?? [];
    }

    if (dataList.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12, top: 5),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: dataList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Container(
                  margin: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.grey.shade300),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade100,
                          blurRadius: 1,
                        )
                      ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 3, right: 10, top: 6),
                        child: cachedNetImgWithRadius(dataList[index].image!, 80, 80, 4, BoxFit.cover),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Txt(
                            txt: dataList[index].productName!,
                            txtColor: Colors.black,
                            txtSize: 16,
                            fontWeight: FontWeight.w600,
                            padding: 2,
                          ),

                          Txt(
                            txt: dataList[index].supplier!,
                            txtColor: Colors.black54,
                            txtSize: 14,
                            fontWeight: FontWeight.normal,
                            padding: 2,
                          ),

                          Txt(
                            txt: 'Price - ${dataList[index].price!}        Qty - ${dataList[index].qty!}',
                            txtColor: Colors.grey.shade600,
                            txtSize: 14,
                            fontWeight: FontWeight.normal,
                            padding: 2,
                          ),

                          Txt(
                            txt: 'Sub total - \$${dataList[index].subtotal!}',
                            txtColor: Colors.grey.shade600,
                            txtSize: 14,
                            fontWeight: FontWeight.normal,
                            padding: 2,
                          ),

                          Txt(
                            txt: 'Variant - ${dataList[index].variant!}',
                            txtColor: Colors.grey.shade600,
                            txtSize: 14,
                            fontWeight: FontWeight.normal,
                            padding: 2,
                          ),

                          InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8,bottom: 4,left: 2),
                                  child: Text(
                                    dataList[index].status!,
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: getColor(dataList[index].status)),
                                    maxLines: 4,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                Visibility(
                                  visible: dataList[index].status! == 'Partially Available' || dataList[index].status! == 'Unavailable',
                                  child: const Icon(
                                    Icons.remove_red_eye,
                                    size: 22,
                                    color: AppColor.appTxtAmber,
                                  ),
                                ),

                              ],
                            ),

                            onTap: (){
                              if (dataList[index].status! == 'Partially Available') {
                                showDropDownDialog(context, dataList[index].approvalQty!, (userInput){
                                  if (kDebugMode) {
                                    print('----userInput : $userInput');
                                  }
                                  updateRequisitionProductStatus(userInput, dataList[index].requisitionId.toString());
                                });
                              } else if (dataList[index].status! == 'Unavailable') {
                                showDropDownDialogForUnavailable(context, dataList[index].approvalCategoryName!, dataList[index].approvalProductName!, dataList[index].approvalVariant!, dataList[index].approvalQty!, (userInput){
                                  if (kDebugMode) {
                                    print('----userInput : $userInput');
                                  }
                                  updateRequisitionProductStatus(userInput, dataList[index].requisitionId.toString());
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: (){
                },
              );
            }),
      );
    } else {
      return NoDataFound(txt: 'No data found\n\nSwipe to view other product', onRefresh: (){});
    }
  }

  Color getColor(status) {
    Color color = Colors.white;
    switch(status){
      case 'Available' :
        color = Colors.green;
        break;
      case 'Partially Available' :
        color =  Colors.orange;
        break;
      case 'Unavailable' :
        color =  Colors.amber.shade800;
        break;
      case 'Cancelled' :
        color =  Colors.red;
        break;
    }
    return color;
  }

  void updateRequisitionProductStatus(String status, String requisitionId) async {
    try{
      showLoadingDialog(context);

      String? userId = await MySharedPreferences().getUserId();

      Map<String, dynamic> body = {};
      body['user_id'] = userId;
      body['requisition_id'] = requisitionId;
      body['status'] = status;

      await ApiFun.apiPostWithBody(ApiConstants.createPurchaseOrder, body).then((jsonDecodeData) {
        StatusMessageApiResModel statusMessageApiResModel = StatusMessageApiResModel.fromJson(jsonDecodeData);
        edgeAlert(context, title: 'Message', description: statusMessageApiResModel.message!);
      });
      isApiDataAvailable = false;
      setState(() {
        _future = getDataFromApi();
      });
    } catch(error){
      print("Error: $error");
    }
  }

  String getTabTitle(int index) {
    String tabTitle = '';
    switch(index){
      case 0 :
        tabTitle = tabBarList[index] + " (${model.response?.requisitionsProduct?.length})";
        break;
      case 1 :
        tabTitle =  tabBarList[index] + " (${model.response?.availableProduct?.length})";
        break;
      case 2 :
        tabTitle =  tabBarList[index] + " (${model.response?.partiallyAvailableProduct?.length})";
        break;
      case 3 :
        tabTitle =  tabBarList[index] + " (${model.response?.unavailableProduct?.length})";
        break;
      case 4 :
        tabTitle =  tabBarList[index] + " (${model.response?.cancelledProduct?.length})";
        break;
    }

    return tabTitle;
  }

}