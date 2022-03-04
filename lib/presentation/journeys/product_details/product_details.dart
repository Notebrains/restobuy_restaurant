import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restobuy_restaurant_flutter/common/extensions/common_fun.dart';
import 'package:restobuy_restaurant_flutter/data/core/api_constants.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/api_functions.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/local_data_source_shared_preferences.dart';
import 'package:restobuy_restaurant_flutter/data/models/CartAddProductApiResModel.dart';
import 'package:restobuy_restaurant_flutter/data/models/product_details_api_res_model.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/my_requisition/custom_app_bar.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/review/add_review.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/drop_down_input.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/edge_alerts/edge_alerts.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/star_rating.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/lottie_loading.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/no_data_found.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt_ic_row.dart';

import 'image_slider.dart';

class ProductDetails extends StatefulWidget {
  final String productId;

  const ProductDetails({Key? key, required this.productId}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  TextEditingController qtyController = TextEditingController();

  late Future<bool> _future;
  late bool isApiDataAvailable = false;
  ProductDetailsApiResModel model = ProductDetailsApiResModel();

  String variant = 'Select';
  String selectedVariant = '';

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
      Map<String, dynamic> body = {};
      body['product_id'] = widget.productId;

      await ApiFun.apiPostWithBody(ApiConstants.productDetails, body).then((jsonDecodeData) => {
        model = ProductDetailsApiResModel.fromJson(jsonDecodeData),
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
      backgroundColor: Colors.white,
      appBar: CustomAppBar(context: context, title: 'Details'),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapShot){
          if(snapShot.hasData){
            if(isApiDataAvailable){
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverAppBar(
                    snap: false,
                    pinned: false,
                    floating: false,
                    flexibleSpace: FlexibleSpaceBar(
                      background: //Auto sliding Banner: Carousel Slider With Indicator
                      SizedBox(
                        //height: Sizes.dimen_350.w,
                        height: 300,
                        width: double.infinity,
                        //margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: ImageSliderCarouselWithIndicator(
                          model: model,
                        ),
                      ),
                    ),
                    expandedHeight: 230,
                    backgroundColor: Colors.white,
                    
                    //To hide default silver back arrow
                    leading: const Icon(Icons.arrow_back_ios, color: Colors.transparent,),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(_buildList(context, model.response!)),
                  ),
                ],
              );
            }
            else {return NoDataFound(txt: 'No Product Found', onRefresh:(){});}
          } else {
            return const LottieLoading();
          }
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                AddReview(
                  productId: widget.productId,
                  productName: model.response!.productName?? '',
                  category: model.response!.categoryName?? '',
                ),
            ),
          );

          setState(() {
            _future = getDataFromApi();
          });
        },
        icon: const Icon(
          Icons.add,
          color: Colors.black,
          size: 20,
        ),
        backgroundColor: Colors.amber.shade600,
        tooltip: 'Pressed',
        elevation: 5,
        label: const Text('Add Review', style: TextStyle(color: Colors.black),),
        isExtended: true,
        splashColor: Colors.grey,
      ),
    );
  }

  List<Widget> _buildList(BuildContext context, Response response) {
    var variantList = model.response!.variant;
    var itemList = ['Select'];
    //itemList.add(variant);

    for(int i=0; i< variantList!.length; i++){
      itemList.add(variantList[i].unit!);
    }

    List<Widget> listItems = [];
    listItems.add(
      Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              response.productName!,
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.amber.shade800),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Text(
                response.categoryName!,
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black87),
              ),
            ),
            Text(
              response.price!,
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 20,
                    width: 45,
                    margin: const EdgeInsets.fromLTRB(0, 8, 8, 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Txt(
                      txt: '${response.rating!} *',
                      txtColor: Colors.white,
                      txtSize: 12,
                      fontWeight: FontWeight.normal,
                      padding: 0,
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 8, 12),
                  child: Text(
                    '${response.totalrating.toString()} rating',
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: AppDropdownInput(
                hintText: "Select", //leave empty to hide text on border
                options: itemList,
                value: variant,
                onChanged: (String? value) {
                  setState(() {
                    variant = value!;
                    selectedVariant = value;

                  });
                },
                getLabel: (String value) => value,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 40,
                    //width: 80,
                    child: TextFormField(
                      controller: qtyController,
                      autocorrect: true,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 14, color: Colors.black87),
                      //validator: validator,
                      //onSaved: onSaved,
                      decoration: InputDecoration(
                        hintText: 'Qty',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(left: 16),
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
                ),
                Expanded(
                  flex: 3,
                  child: InkWell(
                    child: Container(
                        height: 40,
                        //width: 80,
                        margin: const EdgeInsets.only(left: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: const TxtIcRow(
                            txt: 'Add to Requisition',
                            txtColor: Colors.black,
                            txtSize: 14,
                            fontWeight: FontWeight.normal,
                            icon: Icons.add,
                            icColor: Colors.black,
                            isCenter: true)),
                    onTap: () async {
                      if (selectedVariant.isEmpty || selectedVariant == 'Select') {
                        edgeAlert(context, title: "Warning", description: 'Please select variable');
                      } else if (qtyController.text.isEmpty) {
                        edgeAlert(context, title: "Warning", description: 'Please enter quantity');
                      } else {
                          addToCart(widget.productId, selectedVariant, qtyController.text);
                      }
                    },
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 5),
              child: Txt(
                txt: 'Description:',
                txtColor: Colors.black87,
                txtSize: 16,
                fontWeight: FontWeight.normal,
                padding: 0,
              ),
            ),
            Txt(
              txt: parseHtmlString(response.description!),
              txtColor: Colors.black54,
              txtSize: 14,
              fontWeight: FontWeight.normal,
              padding: 0,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 5),
              child: Txt(
                txt: 'Special Notes:',
                txtColor: Colors.black87,
                txtSize: 16,
                fontWeight: FontWeight.normal,
                padding: 0,
              ),
            ),
            Txt(
              txt: parseHtmlString(response.specialNotes??''),
              txtColor: Colors.black54,
              txtSize: 14,
              fontWeight: FontWeight.normal,
              padding: 0,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 12),
              child: Txt(
                txt: 'Rating & Review (${response.totalrating!})',
                txtColor: Colors.black87,
                txtSize: 16,
                fontWeight: FontWeight.normal,
                padding: 0,
              ),
            ),
            SizedBox(
              height: 5 * 100,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: model.response!.review?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(6, 5, 5, 0),
                            child: Text(
                              model.response!.review![index].user!,
                              style: const TextStyle(fontSize: 14, color: Colors.black, letterSpacing: 0.5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 8, 0),
                            child: StarRating(
                              rating: double.parse(model.response!.review![index].rating!.toString()),
                              color: Colors.amber,
                              iconSize: 18,
                              onRatingChanged: (double rating) {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 12, left: 5),
                            child: Text(
                              model.response!.review![index].review?? '',
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              model.response!.review![index].date!,
                              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 13, color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );

    return listItems;
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
          qtyController.clear();
        }
      });
    } catch(error){
      print("Error: $error");
    }
  }
}
