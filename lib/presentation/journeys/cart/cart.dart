import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:restobuy_restaurant_flutter/common/constants/strings.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/appbar_ic_back.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/button_sq_ic.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/cached_net_img_radius.dart';


class Cart extends StatefulWidget {
  @override
  CartState createState() {
    return CartState();
  }
}

class CartState extends State<Cart> {
  final ValueNotifier<int> cartUpdateValueNotify = ValueNotifier<int>(0);
  int itemQty = 0;
  String customerId = '';
  int bottomRadioValue = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarIcBack(context, 'Cart'),
      backgroundColor: Colors.grey[100],
      body: cartUi(),
    );
  }

  Widget cartUi() {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8, bottom: 65, top: 10),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return SlideInLeft(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: Colors.grey.shade50),
                  ),
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.all(6),
                          margin: EdgeInsets.only(right: 8),
                          child: cachedNetImgWithRadius(
                              Strings.imgUrlTestSupplyProduct, 100, 100, 5,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                'Product Name',
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style: TextStyle( fontWeight: FontWeight.bold, fontSize: 14, color: Colors.amber.shade700),
                              ),
                            ),
                            Text(
                              '\$ 15.00',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.black54),
                            ),

                            Text(
                              'Qty: 3',
                              textAlign: TextAlign.start,
                              style:
                              TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.grey[600]),
                            ),

                            Text(
                              'Unit-3kg',
                              textAlign: TextAlign.start,
                              style:
                              TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.grey[600]),
                            ),

                            InkWell(
                              child: Container(
                                height: 25.0,
                                width: 100,
                                margin: const EdgeInsets.only(top: 3),
                                decoration: BoxDecoration(
                                  //color: Colors.blueAccent,
                                  border: Border.all(color: Colors.amber.withOpacity(0.5), width: 1.0),
                                  borderRadius: new BorderRadius.circular(4.0),
                                ),
                                child: new Center(
                                  child: new Text(
                                    ' Change Qty ',
                                    style: new TextStyle(fontSize: 12.0, color: Colors.black54),
                                  ),
                                ),
                              ),
                              onTap: () {

                              },
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.delete_outline_rounded,
                          size: 25,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ButtonSqIc(
                    text: 'Total\n\$ 500.00',
                    size: 16,
                    icon: null,
                    txtColors: Colors.grey.shade700,
                    bgColors: Colors.grey.shade200,
                    icColors: Colors.amber,
                    onPressed: (){

                    },
                ),
              ),
              Expanded(
                flex: 1,
                child: ButtonSqIc(
                    text: 'Checkout',
                    size: 16,
                    icon: Icons.monetization_on,
                    txtColors: Colors.white,
                    bgColors: Colors.amber.shade600,
                    icColors: Colors.white,
                    onPressed: () => {

                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }


  void showLoadingDialog(BuildContext context) {
    BuildContext dialogContext;
    showDialog(
      context: context,
      barrierDismissible: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        dialogContext = context;
        return Dialog(
          backgroundColor: Colors.transparent,
          child: FadeInUp(
            child: Container(
              height: 300,
              //child: TltProgressbar(),
            ),
            preferences: AnimationPreferences(duration: const Duration(milliseconds: 800), autoPlay: AnimationPlayStates.Forward),
          ),
        );
      },
    );

    Timer(Duration(milliseconds: 2000), () {
      //Navigator.pop(dialogContext);
    });
  }
}
