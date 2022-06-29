import 'package:flutter/material.dart';

Widget iconLogo(Icon itemIcon, int count) {
  double cWidth;
  if (count < 10) {
    cWidth = 12;
  } else if (count > 100) {
    cWidth = 22;
  } else {
    cWidth = 16;
  }
  return Column(
    children: [
      Stack(
        children: [
          Container(
              height: 32,
              padding: const EdgeInsets.only(right: 15.0, top: 5.0),
              child: itemIcon),
          Visibility(
              visible: count != 0,
              child: Positioned(
                left: 15,
                bottom: 18,
                child: Offstage(
                  offstage: count == 0,
                  child: Container(
                    width: count != 1 ? cWidth : 8,
                    height: count != 1 ? 14 : 8,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          bottomRight: Radius.circular(7),
                          topRight: Radius.circular(7),
                          bottomLeft: count != 1
                              ? Radius.circular(0)
                              : Radius.circular(7)),
                      color: Color(0xFFFF491C),
                    ),
                    child: Text(
                      count >= 100 ? '99+' : count.toString(),
                      style: TextStyle(
                          color: count != 1 ? Colors.white : Color(0xFFFF491C),
                          fontSize: 8,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ))
        ],
      ),
    ],
  );
}
