
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restobuy_restaurant_flutter/common/constants/route_constants.dart';

import 'cart_counter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final String title;
  final bool showBackButton;
  final bool showActions;

  const CustomAppBar({Key? key,
    required this.context,
    required this.title,
    this.showBackButton = true,
    this.showActions = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold),),
        leading: showBackButton
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => widget,
                    ),
                  );*/
                },
        )
            : null,
        actions: !showActions
            ? null
            : <Widget>[
          /*IconButton(
            icon: const Icon(Icons.favorite_border,
              color: Colors.black,),
            onPressed: () {
              *//*Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return MainHome(
                      selectedIndex: 1,
                    );
                  },
                ),
              );*//*
            },
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
      ),
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }
}