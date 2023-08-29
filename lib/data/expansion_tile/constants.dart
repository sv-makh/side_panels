import 'package:flutter/material.dart';

TextStyle helvetica24 = const TextStyle(
    fontSize: 24, fontFamily: 'HelveticaNeue', fontWeight: FontWeight.bold);
TextStyle inter14 = const TextStyle(
    fontSize: 14, color: Color(0xff464F60), fontFamily: 'Inter');
TextStyle inter12 = const TextStyle(
  fontSize: 12,
  fontFamily: 'Inter',
);
TextStyle helvetica16 = const TextStyle(
    fontSize: 16, fontWeight: FontWeight.bold,);// fontFamily: 'HelveticaNeue');

Color nodeColor = const Color(0xffECF2F9);
Color borderColor = const Color(0xffDADDE5);
Color buttonColor = const Color(0xff5A6376);
Color dividerColor = const Color(0xffC1C1C1);
double indentationLeft = 41;
double indentationRight = 27;
double sidePadding = 21;
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
double fieldHeight = 32;