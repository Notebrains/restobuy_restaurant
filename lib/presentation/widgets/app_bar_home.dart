import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restobuy_restaurant_flutter/common/constants/route_constants.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/my_requisition/cart_counter.dart';

PreferredSizeWidget appBarHome(BuildContext context) {
  return AppBar(
    title: Row(
      children: const [
        Text(
          'Resto',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          'Buy',
          style: TextStyle(
            fontSize: 18,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0.5,
    toolbarHeight: 60,
    leadingWidth: 56,
    leading: Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Image.asset('assets/icons/pngs/logo.png'),
    ),

    actions: <Widget>[
      /*IconButton(
        icon: const Icon(
          Icons.notifications_active,
          color: Colors.black87,
        ),
        onPressed: () {},
      ),*/
      Consumer<CartCounterNotifier>(
        builder: (context, cartCounter, child) {
          //print('----cart Count : ${cartCounter.value}');
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Badge(
              elevation: cartCounter.value != 0 ? 3 : 0,
              position: BadgePosition.topEnd(top: 3, end: 3),
              animationDuration: const Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeColor: cartCounter.value != 0 ? Colors.orangeAccent : Colors.transparent,
              toAnimate: true,
              badgeContent: Text(
                cartCounter.value != 0 ? cartCounter.value.toString(): '',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart_rounded, color: Colors.black,),
                onPressed: () {
                  Navigator.pushNamed(context, RouteList.my_requisition);
                },
              ),
            ),
          );
        },
      ),
    ],
  );
}
