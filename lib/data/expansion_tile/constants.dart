import 'package:flutter/material.dart';

TextStyle helvetica24 = const TextStyle(
  fontSize: 24,
  fontFamily: 'HelveticaNeue',
  fontWeight: FontWeight.bold,
);
TextStyle inter14 = const TextStyle(
  fontSize: 14,
  //color: Color(0xff464F60),
  fontFamily: 'Inter',
);
TextStyle inter14Field = const TextStyle(
  fontSize: 14,
  color: Color(0xff171717),
  fontFamily: 'Inter',
  fontWeight: FontWeight.w400,
);
TextStyle inter14title = const TextStyle(
  fontSize: 14,
  //color: Color(0xff464F60),
  fontFamily: 'Inter',
  fontWeight: FontWeight.w400,
);
TextStyle inter12 = const TextStyle(
  fontSize: 12,
  fontFamily: 'Inter',
);
TextStyle helvetica16 = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  //fontFamily: 'HelveticaNeue',
);

Color nodeColor = const Color(0xffECF2F9);
Color borderColor = const Color(0xffDADDE5);
Color buttonColor = const Color(0xff5A6376);
Color dividerColor = const Color(0xffC1C1C1);
Color iconColor = const Color(0xff49454E);

double indentationLeft = 50;
double indentationRight = 27;
double sidePadding = 21;
double bottomPanelHeight = 59;

ButtonStyle addButtonStyle = OutlinedButton.styleFrom(
  padding: const EdgeInsets.only(right: 8, left: 8),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
  ),
  foregroundColor: buttonColor,
  textStyle: inter12,
  side: BorderSide(color: borderColor),
);

Radius radius = const Radius.circular(6);
OutlineInputBorder border = OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xffDADDE5)),
    borderRadius: BorderRadius.circular(6));


InputDecoration fieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  border: InputBorder.none,
  enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffDADDE5)),
      borderRadius: BorderRadius.circular(6)),
  focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffDADDE5)),
      borderRadius: BorderRadius.circular(6)),
  contentPadding: const EdgeInsets.symmetric(
    vertical: 6,
    horizontal: 12,
  ),
);
InputDecoration bigFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  border: InputBorder.none,
  enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffDADDE5)),
      borderRadius: BorderRadius.circular(6)),
  focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffDADDE5)),
      borderRadius: BorderRadius.circular(6)),
  contentPadding: const EdgeInsets.symmetric(
    vertical: 15,
    horizontal: 12,
  ),
);
double fieldHeight = 32;
double bigFieldHeight = 96;
