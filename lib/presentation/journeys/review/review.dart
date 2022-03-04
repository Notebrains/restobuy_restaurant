import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:lottie/lottie.dart';
import 'package:restobuy_restaurant_flutter/common/constants/strings.dart';
import 'package:restobuy_restaurant_flutter/common/extensions/common_fun.dart';
import 'package:restobuy_restaurant_flutter/data/core/api_constants.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/api_functions.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/local_data_source_shared_preferences.dart';
import 'package:restobuy_restaurant_flutter/data/models/review_api_res_model.dart';
import 'package:restobuy_restaurant_flutter/data/models/status_message_api_res_model.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/edge_alerts/edge_alerts.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/star_rating.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/appbar_back_cart.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/appbar_ic_back.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/cached_net_img_radius.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/lottie_loading.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/no_data_found.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt_if_preview.dart';

class Review extends StatefulWidget {
  static const String routeName = '/review';

  const Review({Key? key}) : super(key: key);

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {

  late Future<bool> _future;
  late bool isApiDataAvailable = false;
  ReviewApiResModel model = ReviewApiResModel();
  StatusMessageApiResModel statusMsgModel = StatusMessageApiResModel();


  @override
  void initState() {
    super.initState();

    //_future = getDataFromApi();
  }


  Future<bool> getDataFromApi() async {
    try{
      String? userId = await MySharedPreferences().getUserId();

      Map<String, dynamic> body = {};
      body["user_id"] = userId;

      await ApiFun.apiPostWithBody(ApiConstants.review, body).then((jsonDecodeData) => {
        model = ReviewApiResModel.fromJson(jsonDecodeData),
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
      backgroundColor: Colors.grey[100],
      appBar: appBarIcBack(context, 'Reviews'),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapShot){
          if(snapShot.hasData){
            if(isApiDataAvailable && snapShot.connectionState == ConnectionState.done && model.response != null){
              return buildUi(model.response?? []);
            }
            else { return NoDataFound(txt: "Review or Rating is not given yet", onRefresh: (va){});}
          } else {
            return const LottieLoading();
          }
        },
      ),
    );
  }

  Widget buildUi(List<Response> response) {
    return Column(
      children: [
        /*FadeInDown(
          child: Container(
            height: 125,
            width: double.maxFinite,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 16, right: 16, top: 12),
            padding: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Colors.grey[300]),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BounceInDown(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      '4.0',
                      style: TextStyle( fontSize: 30, color: Colors.black54),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 8),
                  child: StarRating(
                    rating: 4.5,
                    color: Colors.amber,
                    iconSize: 25,
                  ),
                ),

                Text(
                  'Based on 20 reviews',
                  style: TextStyle( fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),*/

        Expanded(
          child: FadeInUpBig(
            child: Container(
              margin: const EdgeInsets.only(bottom: 12, top: 8),
              //color: Colors.white,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: response.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5, bottom: 3),
                                child: cachedNetImgWithRadius(Strings.imgUrlTestSupplyProduct, 60,
                                    60, 3, BoxFit.contain),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(6, 5, 5, 0),
                                    child: Text(
                                      response[index].productName?? '',
                                      style: const TextStyle( fontSize: 14, color: Colors.black87, letterSpacing: 0.5),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(5, 3, 8, 0),
                                        child: StarRating(
                                          rating: double.parse(response[index].rating.toString()),
                                          color: Colors.amber,
                                          iconSize: 20,
                                          onRatingChanged: (double rating) {  },
                                        ),
                                      ),

                                      Text(
                                        response[index].rating!.toString(),
                                        style: const TextStyle(fontSize: 14, color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 12, left: 3),
                            child: Text(
                              response[index].review?? '',
                              style: const TextStyle( fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
                            ),
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                response[index].reviewBy!,
                                style: const TextStyle( fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black54),
                              ),

                              /*const Text(
                                '25 jan, 2021',
                                style: TextStyle( fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black54),
                              ),*/
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  child: Container(
                                    height: 40,
                                    margin: const EdgeInsets.only(top: 8, right: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.1),
                                      border: Border.all(color: Colors.grey.shade400),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Txt(
                                      txt: 'Edit',
                                      txtColor: Colors.black,
                                      txtSize: 14,
                                      fontWeight: FontWeight.normal,
                                      padding: 3,
                                    ),
                                  ),
                                  onTap: () {
                                    showEditReviewDialog(context, response[index].review!, response[index].rating.toString(), response[index].productName!, response[index].reviewId!, onClose: (message){
                                      edgeAlert(context, title: 'Message', description: message);
                                      setState(() {
                                        getDataFromApi();
                                      });
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  child: Container(
                                    height: 40,
                                    margin: const EdgeInsets.only(top: 8, left: 4,),
                                    decoration: BoxDecoration(
                                      color: Colors.pinkAccent.withOpacity(0.1),
                                      border: Border.all(color: Colors.grey.shade400),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Txt(
                                      txt: 'Delete',
                                      txtColor: Colors.black,
                                      txtSize: 14,
                                      fontWeight: FontWeight.normal,
                                      padding: 3,
                                    ),
                                  ),
                                  onTap: () async {
                                    deleteReview(response[index].reviewId.toString());
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }

  void showEditReviewDialog(BuildContext context, String reviews, String rating, String productName, int reviewId,
      {required Function(String reason) onClose}) async {
    String review = reviews;
    double ratings = double.parse(rating);
    showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: ZoomIn(
            child: Container(
              width: 450,
              height: 600,
              margin: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Txt(txt: 'Edit Rating & Review', txtColor: Colors.black54, txtSize: 14, fontWeight: FontWeight.bold, padding: 8 ),

                    TxtIfPreview(txt: 'Supplier', ifTxt: '', icon: Icons.support_agent_sharp, onTap: (){

                    }),

                    TxtIfPreview(txt: 'Product Name', ifTxt: productName, icon: Icons.shopping_cart_outlined, onTap: (){

                    }),

                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Txt(txt: 'Rating', txtColor: Colors.black54, txtSize: 14, fontWeight: FontWeight.bold, padding: 8 ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: StarRating(
                        rating: ratings,
                        color: Colors.amber,
                        iconSize: 20,
                        onRatingChanged: (double rating) {
                          setState(() {
                            ratings = rating;
                          });
                        },
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(left: 8, bottom: 12, top: 16),
                      child: Txt(txt: 'Provide Review', txtColor: Colors.black54, txtSize: 14, fontWeight: FontWeight.bold,
                          padding: 0, ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      //padding:  const EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey.shade300
                        ),
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 310.0,
                        ),
                        child: TextFormField(
                          minLines: 8,
                          maxLines: 22,
                          initialValue: review,
                          enabled: true,
                          autocorrect: true,
                          keyboardType: TextInputType.text,
                          validator: (value){

                          },
                          onChanged: (value){
                            review = value;
                          },
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(2.0)),
                              borderSide: BorderSide(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      height: 30,
                      margin: const EdgeInsets.only(right: 8.0, top: 16, left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            elevation: 0,
                            color: const Color(0xFFFF8080),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close',
                                style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: MaterialButton(
                              elevation: 0,
                              color: const Color(0xFF32DE3C),
                              child: const Text('Update',
                                  style: TextStyle( fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),

                              onPressed: () async {
                                Navigator.pop(context);
                                isApiDataAvailable == false;

                                Map<String, dynamic> data = {};
                                data["review_id"] = reviewId.toString();
                                data["rating"] = rating;
                                data["review"] = review;

                                await ApiFun.apiPostWithBody(ApiConstants.updateReview, data).then((jsonDecodeData) => {
                                  statusMsgModel = StatusMessageApiResModel.fromJson(jsonDecodeData),
                                });

                                onClose(statusMsgModel.message!);
                                //Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            preferences: const AnimationPreferences(duration: Duration(milliseconds: 900), autoPlay: AnimationPlayStates.Forward),
          ),
        );
      },
    );
  }


  void deleteReview(String reviewId) async {
    try{
      showLoadingDialog(context);

      Map<String, dynamic> body = {};
      body["review_id"] = reviewId;

      await ApiFun.apiPostWithBody(ApiConstants.deleteReview, body).then((jsonDecodeData) => {
        statusMsgModel = StatusMessageApiResModel.fromJson(jsonDecodeData),
        edgeAlert(context, title: 'Message', description: statusMsgModel.message!),
      });

      if (statusMsgModel.status == 1) {
        _future = getDataFromApi();
      }
    } catch(error){
      print("Error: $error");
    }
  }
}
