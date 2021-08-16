import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restobuy_restaurant_flutter/common/constants/route_constants.dart';

import 'badge_icon.dart';

PreferredSizeWidget appBarHome(BuildContext context) {
  return AppBar(
    title: Image.asset('assets/images/logo_horizon.png', fit: BoxFit.cover, width: 120),
    centerTitle: false,
    backgroundColor: Colors.white,
    elevation: 3,
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.notifications_none_rounded,
          color: Colors.black87,
        ),
        onPressed: () {},
      ),
      BadgeIcon(
        icon: Icon(
          Icons.shopping_cart_rounded,
          size: 25,
        ),
        badgeCount: 5,
        onTap: () {
          Navigator.of(context).pushNamed(RouteList.cart);
        },
      ),
    ],
  );
}
