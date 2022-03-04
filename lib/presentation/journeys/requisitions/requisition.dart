import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:restobuy_restaurant_flutter/common/constants/route_constants.dart';
import 'package:restobuy_restaurant_flutter/common/extensions/common_fun.dart';
import 'package:restobuy_restaurant_flutter/data/core/api_constants.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/api_functions.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/local_data_source_shared_preferences.dart';
import 'package:restobuy_restaurant_flutter/data/models/requisition_api_res_model.dart';
import 'package:restobuy_restaurant_flutter/data/models/status_message_api_res_model.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/my_requisition/custom_app_bar.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/requisitions/save_requisition_list_widget.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/requisitions_details/save_requisation_details.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/requisitions_details/view_requisition.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/edge_alerts/edge_alerts.dart';
import 'package:restobuy_restaurant_flutter/presentation/themes/theme_color.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/bottomsheet_save_requisition.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/lottie_loading.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/no_data_found.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt.dart';

import 'requisition_list_widget.dart';

class Requisition extends StatefulWidget {
  const Requisition({Key? key}) : super(key: key);

  @override
  _RequisitionsState createState() => _RequisitionsState();
}

class _RequisitionsState extends State<Requisition> {
  TextEditingController controller = TextEditingController();
  String? userId = '';
  String fromDateStr = '', toDateStr = '';
  bool isRequisitionTabSelected = true;
  late DateTime fromDate;
  late DateTime toDate;
  late List<String> listData = [];

  late Future<bool> _future;
  late bool isApiDataAvailable = false;
  RequisitionApiResModel model = RequisitionApiResModel();
  StatusMessageApiResModel statusMessageApiResModel = StatusMessageApiResModel();


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
      userId = await MySharedPreferences().getUserId();

      Map<String, dynamic> body = {};
      body['user_id'] = userId;

      await ApiFun.apiPostWithBody(ApiConstants.requisitions, body).then((jsonDecodeData) => {
        model = RequisitionApiResModel.fromJson(jsonDecodeData),
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
      appBar: CustomAppBar(context: context, title: 'Requisition'),
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
        future: _future,
        builder: (context, snapShot){
          if(snapShot.hasData && snapShot.connectionState == ConnectionState.done){
            if(isApiDataAvailable){
              return Column(
                children: [
                  SlideInLeft(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          child: Container(
                            height: 45,
                            margin: const EdgeInsets.only(bottom: 5, top: 12, left: 16, right: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: isRequisitionTabSelected? Colors.amber : Colors.grey.shade50),
                            ),
                            alignment: Alignment.center,
                            child:
                            Txt(
                              txt: '  Requisition  ',
                              txtColor: isRequisitionTabSelected? AppColor.appTxtAmber : Colors.black,
                              txtSize: 16,
                              fontWeight: isRequisitionTabSelected? FontWeight.bold : FontWeight.normal,
                              padding: 6,
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              isRequisitionTabSelected = true;
                            });
                          },
                        ),

                        InkWell(
                          child: Container(
                            height: 45,
                            margin: const EdgeInsets.only(bottom: 5, top: 12, left: 4, right: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: isRequisitionTabSelected? Colors.grey.shade50: Colors.amber),
                            ),
                            alignment: Alignment.center,
                            child:
                            Txt(
                              txt: '  Save Requisition  ',
                              txtColor: isRequisitionTabSelected? Colors.black : AppColor.appTxtAmber,
                              txtSize: 16,
                              fontWeight: isRequisitionTabSelected? FontWeight.normal : FontWeight.bold,
                              padding: 6,
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              isRequisitionTabSelected = false;
                            });
                          },
                        ),

                      ],
                    ),
                  ),

                  Expanded(
                    child: SlideInUp(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: isRequisitionTabSelected ?
                            model.response!.requisitions!.length :
                            model.response!.saveRequisitions!.length,
                            itemBuilder: (BuildContext context, int index) {
                              //Two condition applied to separate tabs data
                              if (isRequisitionTabSelected) {
                                return RequisitionListWidget(
                                  response: model.response!.requisitions!,
                                  index: index,
                                  onTapOnList: (intValue){
                                    Navigator.of(context).pushNamed(RouteList.requisitions_details);
                                  },
                                  onRefreshed: () {
                                  },
                                  onDelete: (int index) {
                                    deleteRequisition(model.response!.requisitions![index].requisitionId.toString());
                                  },

                                  onView: (int index) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>
                                            ViewRequisition(requisitionId: model.response!.requisitions![index].requisitionId.toString(),),
                                        ),
                                      );
                                    },

                                  onAddToCart: (int index) {  },

                                  onSave: (int index) {
                                    showBottomSheetUiToSaveRequisition(context, (templateName){
                                      saveRequisition(
                                        model.response!.requisitions![index].requisitionId.toString(),
                                        templateName,
                                      );
                                    });

                                  },
                                );
                              } else {
                                return SaveRequisitionListWidget(
                                  response: model.response!.saveRequisitions!,
                                  index: index,
                                  onTapOnList: (intValue){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>
                                          SaveRequisitionDetails(
                                            requisitionId: model.response!.saveRequisitions![index].requisitionId.toString(),
                                            templateName: model.response!.saveRequisitions![index].template.toString(),
                                            requisitionType: 'SavedRequisition',
                                            qty: model.response!.saveRequisitions![index].totalItems.toString(),
                                            dateTime: model.response!.saveRequisitions![index].datetime!,),
                                      ),
                                    );
                                  },
                                  onRefreshed: () {},
                                  onDelete: (int index) {
                                    deleteSavedRequisition(model.response!.saveRequisitions![index].id.toString());
                                  },

                                  onView: (int index) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>
                                          SaveRequisitionDetails(
                                            requisitionId: model.response!.saveRequisitions![index].requisitionId.toString(),
                                            templateName: model.response!.saveRequisitions![index].template.toString(),
                                            requisitionType: 'SavedRequisition',
                                            qty: model.response!.saveRequisitions![index].totalItems.toString(),
                                            dateTime: model.response!.saveRequisitions![index].datetime!,
                                          ),
                                      ),
                                    );
                                  },

                                  onAddToCart: (int index) {
                                    addToCart(model.response!.saveRequisitions![index].requisitionId.toString(),
                                      model.response!.saveRequisitions![index].totalItems!);
                                  }, onSave: (int index) {  },
                                );
                              }
                            }),
                      ),
                    ),
                  ),
                ],
              );
            }
            else {return NoDataFound(txt: 'No Requisition To Show', onRefresh:(){});}
          } else {
            return const LottieLoading();
          }
        },
      ),
    );
  }


  void saveRequisition(String requisitionId, String templateName) async {
    try{
      showLoadingDialog(context);

      Map<String, dynamic> body = {};
      body['user_id'] = userId;
      body['requisition_id'] = requisitionId;
      body['template'] = templateName;

      await ApiFun.apiPostWithBody(ApiConstants.saveRequisitions, body).then((jsonDecodeData) => {
        statusMessageApiResModel = StatusMessageApiResModel.fromJson(jsonDecodeData),
        edgeAlert(context, title: 'Message', description: statusMessageApiResModel.message!),
      });
      isApiDataAvailable = false;
      setState(() {
        _future = getDataFromApi();});
    } catch(error){
      print("Error: $error");
    }
  }

  void deleteRequisition(String requisitionId) async {
    try{
      showLoadingDialog(context);

      Map<String, dynamic> body = {};
      body['requisition_id'] = requisitionId;
      await ApiFun.apiPostWithBody(ApiConstants.deleteRequisition, body).then((jsonDecodeData) => {
        statusMessageApiResModel = StatusMessageApiResModel.fromJson(jsonDecodeData),
        edgeAlert(context, title: 'Message', description: statusMessageApiResModel.message!),
      });
      isApiDataAvailable = false;
      setState(() {
        _future = getDataFromApi();});
    } catch(error){
      print("Error: $error");
    }
  }

  void deleteSavedRequisition(String id) async {
    try{
      showLoadingDialog(context);

      Map<String, dynamic> body = {};
      body['id'] = id;
      await ApiFun.apiPostWithBody(ApiConstants.deleteSaveRequisition, body).then((jsonDecodeData) => {
        statusMessageApiResModel = StatusMessageApiResModel.fromJson(jsonDecodeData),
        edgeAlert(context, title: 'Message', description: statusMessageApiResModel.message!),
      });
      isApiDataAvailable = false;
      setState(() {
        _future = getDataFromApi();});
    } catch(error){
      print("Error: $error");
    }
  }

  void addToCart(String requisitionId, int totalItems) async {
    try{
      showLoadingDialog(context);

      Map<String, dynamic> body = {};
      body['user_id'] = userId;
      body['requisition_id'] = requisitionId;

      await ApiFun.apiPostWithBody(ApiConstants.addSavedRequisitionToCart, body).then((jsonDecodeData) {
        statusMessageApiResModel = StatusMessageApiResModel.fromJson(jsonDecodeData);
        edgeAlert(context, title: 'Message', description: statusMessageApiResModel.message!);
      });

      int? count = await MySharedPreferences().getCartItemCount();
      if (count != null) {
        count = count + totalItems;
        saveCartCount(context, count);
      }

      isApiDataAvailable = false;
      setState(() {
        _future = getDataFromApi();
      });
    } catch(error){
      print("Error: $error");
    }
  }

}
