import 'package:flutter/material.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/star_rating.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/appbar_back_cart.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/button.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/drop_down_input.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/review_txt.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt_input_field.dart';

class AddReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarIcBackCart(context, 'Add Review'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 8),
            child: AppDropdownInput(
              hintText: "Select Supplier",
              options: ["Choose Option", "Restaurant One", "Restaurant Two"],
              value: 'Choose Option',
              onChanged: (String? value) {
                /*setState(() {
                    gender = value;
                    // state.didChange(newValue);
                  });*/
              },
              getLabel: (String value) => value,
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 8),
            child: AppDropdownInput(
              hintText: "Select Product",
              options: ["Choose Option", "Restaurant One", "Restaurant Two"],
              value: 'Choose Option',
              onChanged: (String? value) {
                /*setState(() {
                    gender = value;
                    // state.didChange(newValue);
                  });*/
              },
              getLabel: (String value) => value,
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
            child: Txt(txt: 'Add Product Rating', txtColor: Colors.black, txtSize: 14,
                fontWeight: FontWeight.bold, padding: 0, onTap: (){},
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 8),
            child: StarRating(onRatingChanged: (rating){

            }, color: Colors.amber, iconSize: 35,
            ),
          ),

          ReviewTxtIf(txt: 'Write your review', initialTxtValue: '', hint: 'Type here...'),

          Container(
            padding: const EdgeInsets.all(18.0),
            child: Button(text: 'SUBMIT', onPressed: (){

            }),
          ),
        ],
      ),
    );
  }
}