import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:restobuy_restaurant_flutter/common/constants/route_constants.dart';
import 'package:restobuy_restaurant_flutter/common/constants/strings.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/star_rating.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/appbar_back_cart.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/button.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/cached_net_img_radius.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/drop_down_input.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/search_bar.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt.dart';

class Product extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarIcBackCart(context, 'Product'),
      body: Column(
        children: [
          //SearchBar(),

         /* Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 0),
            child: AppDropdownInput(
              hintText: "Select Supplier",
              options: ["Choose Option", "Restaurant One", "Restaurant Two"],
              value: 'Choose Option',
              onChanged: (String? value) {
                *//*setState(() {
                    gender = value;
                    // state.didChange(newValue);
                  });*//*
              },
              getLabel: (String value) => value,
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 0),
            child: AppDropdownInput(
              hintText: "Choose Category",
              options: ["Choose Option", "Restaurant One", "Restaurant Two"],
              value: 'Choose Option',
              onChanged: (String? value) {
                *//*setState(() {
                        gender = value;
                        // state.didChange(newValue);
                      });*//*
              },
              getLabel: (String value) => value,
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 0),
            child: AppDropdownInput(
              hintText: "Choose Sub Category",
              options: ["Choose Option", "Restaurant One", "Restaurant Two"],
              value: 'Choose Option',
              onChanged: (String? value) {
                *//*setState(() {
                        gender = value;
                        // state.didChange(newValue);
                      });*//*
              },
              getLabel: (String value) => value,
            ),
          ),*/

          Expanded(
            child: SlideInUp(
              child: Container(
                margin: const EdgeInsets.all(16),
                child: GridView.count(
                  shrinkWrap: false,
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 4.0,
                  childAspectRatio: 4/5,
                  physics: BouncingScrollPhysics(),
                  children: List.generate(20, (index) {
                    return InkWell(
                      child: Card(
                        elevation: 8,
                        color: Colors.white,
                        shadowColor: Colors.grey.withOpacity(0.2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            cachedNetImgWithRadius(Strings.imgUrlTestSupplyProduct, 200, 110, 5),

                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Txt(txt: 'Product Title', txtColor: Colors.black, txtSize: 14, fontWeight: FontWeight.bold,
                                  padding: 0, onTap: () {},
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: StarRating(
                                  rating: 4.5,
                                  onRatingChanged: (rating){}, color: Colors.amber, iconSize: 16),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Txt(txt: 'Lorem ipsum restus', txtColor: Colors.black, txtSize: 12, fontWeight: FontWeight.normal,
                                  padding: 0, onTap: () {},
                              ),
                            ),

                            Expanded(
                              child: Row(
                                children: [
                                  Txt(txt: '  Qty ', txtColor: Colors.black, txtSize: 12, fontWeight: FontWeight.normal,
                                    padding: 0, onTap: () {},
                                  ),

                                  Container(
                                    height: 25,
                                    width: 60,
                                    margin: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                                    child: TextFormField(
                                      initialValue: '1',
                                      autocorrect: true,
                                      keyboardType: TextInputType.number,
                                      //validator: validator,
                                      //onSaved: onSaved,
                                      decoration: InputDecoration(
                                        hintText: 'Qty',
                                        hintStyle: TextStyle(color: Colors.grey),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.only(left: 8),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                                          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                                          borderSide: BorderSide(color: Colors.amber, width: 1),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Container(
                                    width: 45,
                                    height: 25,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child:  Text(
                                      'Add',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(RouteList.product_details);
                      },
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}