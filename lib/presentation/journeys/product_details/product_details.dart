import 'package:flutter/material.dart';
import 'package:restobuy_restaurant_flutter/common/constants/route_constants.dart';
import 'package:restobuy_restaurant_flutter/common/constants/strings.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/star_rating.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/badge_icon.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/drop_down_input.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt_ic_row.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              snap: false,
              pinned: false,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  Strings.imgUrlTestSupplyProduct,
                  fit: BoxFit.cover,
                ),
              ),
              expandedHeight: 260,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded),
                tooltip: 'Back to previous page',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              actions: <Widget>[
                BadgeIcon(
                  icon: Icon(
                    Icons.shopping_cart_rounded,
                    size: 25,
                    color: Colors.black,
                  ),
                  badgeCount: 5,
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteList.cart);
                  },
                ),
              ],
            ),

            SliverList(
              delegate: SliverChildListDelegate(_buildList(context)),
            )
      ],
    ));
  }

  List<Widget> _buildList(BuildContext context) {
    List<Widget> listItems = [];
    listItems.add(Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 24, right: 24, top: 8),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Food & Beverages',
            textAlign: TextAlign.start,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.amber.shade700),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              'Farm Quail Eggs',
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black87),
            ),
          ),

          Text(
            '\$ 100.00',
            textAlign: TextAlign.start,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87),
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
                  child:  Txt(
                    txt: '4.5 *', txtColor: Colors.white, txtSize: 12, fontWeight: FontWeight.normal, padding: 0,
                    onTap: (){

                    },
                  )
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 12),
                child: Text(
                  '3,60,00 rating',
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 14, color: Colors.black54),
                ),
              ),
            ],
          ),


          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: AppDropdownInput(
              hintText: "Select Variables",
              options: ["Select Variables", "6 pcs", "4x5 pcs multipack"],
              value: 'Select Variables',
              onChanged: (String? value) {
              /*setState(() {
                gender = value;
                // state.didChange(newValue);
              });*/
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
                child: Container(
                  height: 40,
                  //width: 80,
                  child: TextFormField(
                    initialValue: 'Qry - 1',
                    autocorrect: true,
                    keyboardType: TextInputType.number,
                    //validator: validator,
                    //onSaved: onSaved,
                    decoration: InputDecoration(
                      hintText: 'Qty',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.only(left: 16),
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
              ),



              Expanded(
                flex: 3,
                child: Container(
                  height: 40,
                  //width: 80,
                  margin: const EdgeInsets.only(left: 16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child:  TxtIcRow(txt: 'Add to Requisition', txtColor: Colors.black, txtSize: 14, fontWeight: FontWeight.normal,
                      icon: Icons.add, icColor: Colors.black, isCenter: true)
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 5),
            child: Txt(txt: 'Description:', txtColor: Colors.black87, txtSize: 16, fontWeight: FontWeight.normal,
                padding: 0, onTap: (){},
            ),
          ),


          Txt(txt: Strings.txt_desc, txtColor: Colors.black54, txtSize: 14, fontWeight: FontWeight.normal,
            padding: 0, onTap: (){},
          ),

          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 5),
            child: Txt(txt: 'Special Notes:', txtColor: Colors.black87, txtSize: 16, fontWeight: FontWeight.normal,
              padding: 0, onTap: (){},
            ),
          ),


          Txt(txt: Strings.txt_lorem_ipsum_small, txtColor: Colors.black54, txtSize: 14, fontWeight: FontWeight.normal,
            padding: 0, onTap: (){},
          ),


          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Txt(txt: 'Rating & Review', txtColor: Colors.black87, txtSize: 16, fontWeight: FontWeight.normal,
              padding: 0, onTap: (){},
            ),
          ),

          SizedBox(
            height: 5*100,
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only( bottom: 12),
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
                            'Username',
                            style: TextStyle(fontSize: 14, color: Colors.black, letterSpacing: 0.5),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 8, 0),
                          child: StarRating(
                            rating: 3.5,
                            color: Colors.amber,
                            iconSize: 18,
                            onRatingChanged: (double rating) {  },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 12, left: 3),
                          child: Text(
                            Strings.txt_lorem_ipsum_big,
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey),
                          ),
                        ),

                        Text(
                          ' 25 jan, 2021',
                          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13, color: Colors.black54),
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
}
