import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restobuy_restaurant_flutter/common/extensions/common_fun.dart';
import 'package:restobuy_restaurant_flutter/data/core/api_constants.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/api_functions.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/local_data_source_shared_preferences.dart';
import 'package:restobuy_restaurant_flutter/data/models/status_message_api_res_model.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/my_requisition/custom_app_bar.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/edge_alerts/edge_alerts.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/star_rating.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/appbar_back_cart.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/button.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/drop_down_input.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/review_txt.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt_input_field.dart';

class AddReview extends StatefulWidget {
  final String productId;
  final String productName;
  final String category;

  const AddReview({Key? key, required this.productId, required this.productName, required this.category}) : super(key: key);


  @override
  _AddReviewState createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  double rating = 0;
  TextEditingController reviewController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context, title: 'Add Review'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Padding(
              padding: EdgeInsets.fromLTRB(25.0, 18, 25.0, 8),
              child: Text(
                'Category',
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black87),
              ),
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 2.0,
                ),
              ]),
              margin: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: TextFormField(
                initialValue: widget.category,
                autocorrect: true,
                style: const TextStyle(color: Colors.black),
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: '',
                  contentPadding: EdgeInsets.all(8),
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.amber, width: 1),
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(25.0, 18, 25.0, 8),
              child: Text(
                'Product',
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black87),
              ),
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 2.0,
                ),
              ]),
              margin: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: TextFormField(
                initialValue: widget.productName,
                autocorrect: true,
                style: const TextStyle(color: Colors.black),
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: '',
                  contentPadding: EdgeInsets.all(8),
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.amber, width: 1),
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(24, 24, 24, 12),
              child: Txt(txt: 'Add Product Rating', txtColor: Colors.black, txtSize: 14,
                  fontWeight: FontWeight.normal, padding: 0,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 8),
              child: StarRating(
                rating: rating,
                onRatingChanged: (ratingValue){
                  setState(() {
                    rating = ratingValue;
                  });
              }, color: Colors.amber, iconSize: 30,
              ),
            ),

            ReviewTxtIf(txt: 'Write your review', initialTxtValue: reviewController.text, hint: 'Type here...', onSaved: (text) {
              reviewController.text = text;
            }, maxLine: 8,),

            Container(
              padding: const EdgeInsets.all(18.0),
              child: Button(text: 'Submit', onPressed: (){
                  doReviewAndRating((){
                    Timer(const Duration(milliseconds: 2000), () {
                      Navigator.of(context).pop(true);
                    });

                  });
              }),
            ),
          ],
        ),
      ),
    );
  }


  void doReviewAndRating(Function() onClose) async {
    showLoadingDialog(context);
    try{
      String? userId = await MySharedPreferences().getUserId();
      Map<String, dynamic> body = {};
      body['user_id'] = userId;
      body['product_id'] = widget.productId;
      body['rating'] = rating.toString();
      body['review'] = reviewController.text;

      print('---- : ${reviewController.text} ,$rating, ');

      await ApiFun.apiPostWithBody(ApiConstants.addReview, body).then((jsonDecodeData) {
        StatusMessageApiResModel model = StatusMessageApiResModel.fromJson(jsonDecodeData);
        edgeAlert(context, title: 'Message', description: model.message!);
        if (model.status == 1) {
          onClose();
        }
      });
    } catch(error){
      print("Error: $error");
    }
  }
}