import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:restobuy_restaurant_flutter/common/extensions/common_fun.dart';
import 'package:restobuy_restaurant_flutter/data/core/api_constants.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/api_functions.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/local_data_source_shared_preferences.dart';
import 'package:restobuy_restaurant_flutter/data/models/SaveRequisitionsDetailsApiResModel.dart';
import 'package:restobuy_restaurant_flutter/data/models/status_message_api_res_model.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/my_requisition/custom_app_bar.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/cached_pdfview.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/edge_alerts/edge_alerts.dart';
import 'package:restobuy_restaurant_flutter/presentation/themes/theme_color.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/cached_net_img_radius.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/lottie_loading.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/no_data_found.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt_ic_row.dart';

class SaveRequisitionDetails extends StatefulWidget {
  final String requisitionId;
  final String templateName;
  final String requisitionType;
  final String dateTime;
  final String qty;

  const SaveRequisitionDetails({Key? key,
    required this.requisitionId,
    required this.templateName,
    required this.requisitionType, required this.dateTime, required this.qty}) : super(key: key);

  @override
  State<SaveRequisitionDetails> createState() => _SaveRequisitionDetailsState();
}

class _SaveRequisitionDetailsState extends State<SaveRequisitionDetails> {
  List<RequisitionsProduct> dataList = [];
  //List<Save_requisitions_product> savedRequisitionList = [];

  late Future<bool> _future;

  late bool isApiDataAvailable = false;

  SaveRequisitionsDetailsApiResModel model = SaveRequisitionsDetailsApiResModel();

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

      await ApiFun.apiPostWithBody(ApiConstants.saveRequisitionsProduct, body).then((jsonDecodeData) => {
        model = SaveRequisitionsDetailsApiResModel.fromJson(jsonDecodeData),
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
      appBar: CustomAppBar(context: context, title: 'Info'),
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
        future: _future,
        builder: (context, snapShot){
          if(snapShot.hasData){
            if(isApiDataAvailable){
              dataList = model.response!.requisitionsProduct?? [];

              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Txt(
                              txt: 'Template Name - ${widget.templateName}',
                              txtColor: AppColor.appTxtAmber,
                              txtSize: 14,
                              fontWeight: FontWeight.bold,
                              padding: 2,
                            ),


                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: TxtIcRow(
                                txt: widget.dateTime,
                                txtColor: Colors.black54,
                                txtSize: 14,
                                fontWeight: FontWeight.normal,
                                icon: Icons.date_range,
                                icColor: Colors.black54,
                                isCenter: true,
                              ),
                            ),
                          ],
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              child:
                                const Padding(padding: EdgeInsets.only(right: 12),
                                  child: TxtIcRow(
                                    txt: 'View',
                                    txtColor: Colors.red,
                                    txtSize: 14,
                                    fontWeight: FontWeight.bold,
                                    icon: Icons.picture_as_pdf_rounded,
                                    icColor: Colors.red,
                                    isCenter: true,
                                  ),
                              ),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      CachedPdfView(pdfUrl: model.response!.pdffile!.pdf?? ''),
                                ),
                                );
                              },
                            ),

                            Txt(
                              txt: '${widget.qty} Items',
                              txtColor: Colors.black,
                              txtSize: 14,
                              fontWeight: FontWeight.bold,
                              padding: 2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  buildListUi(dataList),
                ],
              );
            }
            else {return NoDataFound(txt: 'No data found', onRefresh: (){});}
          } else {
            return const LottieLoading();
          }
        },
      ),
      floatingActionButton: Visibility(
        visible: isApiDataAvailable,
        child: FloatingActionButton.extended(
          onPressed: () {
            addToCart(widget.requisitionId);
          },
          icon: const Icon(
            Icons.add_shopping_cart_rounded,
            color: Colors.black,
            size: 20,
          ),
          backgroundColor: Colors.amber.shade600,
          tooltip: 'Pressed',
          elevation: 5,
          label: const Text('Add to cart', style: TextStyle(color: Colors.black, fontSize: 14),),
          isExtended: true,
          splashColor: Colors.grey,
        ),
      ),
    );
  }

  Widget buildListUi(List<dynamic> dataList) {
    return Expanded(
      child: SlideInUp(
        child: Container(
          margin: const EdgeInsets.only(bottom: 12,),
          color: Colors.grey[100],
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3, right: 10),
                            child: cachedNetImgWithRadius(dataList[index].image!, 100, 100, 4, BoxFit.cover),
                          ),
                        ),

                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Txt(
                                txt: dataList[index].productName!,
                                txtColor: Colors.black,
                                txtSize: 16,
                                fontWeight: FontWeight.bold,
                                padding: 0,
                              ),

                              Txt(
                                txt: 'QTY - ${dataList[index].qty!}     Variant - ${dataList[index].variant!}',
                                txtColor: Colors.grey.shade600,
                                txtSize: 14,
                                fontWeight: FontWeight.normal,
                                padding: 0,
                              ),

                              Txt(
                                txt: dataList[index].supplier!,
                                txtColor: Colors.black,
                                txtSize: 14,
                                fontWeight: FontWeight.normal,
                                padding: 0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                  },
                );
              }),
        ),
      ),
    );
  }


  void addToCart(String requisitionId) async {
    try{
      showLoadingDialog(context);
      String? userId = await MySharedPreferences().getUserId();

      Map<String, dynamic> body = {};
      body['user_id'] = userId;
      body['requisition_id'] = requisitionId;

      await ApiFun.apiPostWithBody(ApiConstants.addSavedRequisitionToCart, body).then((jsonDecodeData) {
        StatusMessageApiResModel statusMessageApiResModel = StatusMessageApiResModel.fromJson(jsonDecodeData);
        edgeAlert(context, title: 'Message', description: statusMessageApiResModel.message!);
      });

      int? count = await MySharedPreferences().getCartItemCount();
      if (count != null) {
        count = count + 1;
        saveCartCount(context, count);
      }

      isApiDataAvailable = false;
      setState(() {});
    } catch(error){
      print("Error: $error");
    }
  }

}
