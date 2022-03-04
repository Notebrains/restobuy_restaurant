import 'package:flutter/material.dart';

class BadgeIcon extends StatelessWidget {
  const BadgeIcon(
      {Key? key,  required this.icon,
        this.badgeCount = 0,
        this.showIfZero = false,
        this.badgeColor = Colors.deepOrange,
        required this.onTap,
        TextStyle? badgeTextStyle})
      : badgeTextStyle = badgeTextStyle ??
      const TextStyle(
        color: Colors.white,
        fontSize: 8,
      ), super(key: key);
  final Widget icon;
  final int badgeCount;
  final bool showIfZero;
  final Color badgeColor;
  final Function onTap;
  final TextStyle badgeTextStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Stack(children: <Widget>[
        Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(right: 14),
              child: icon,
            )),
        if (badgeCount > 0 || showIfZero) badge(badgeCount),
      ]),
    );
  }

  Widget badge(int count) => Positioned(
    right: 10,
    top: 8,
    child: Container(
      padding: const EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(8.5),
      ),
      constraints: const BoxConstraints(
        minWidth: 15,
        minHeight: 15,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 3),
        child: Text(
          count.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}