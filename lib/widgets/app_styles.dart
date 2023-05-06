// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FontFamily {
  static final poppins = 'Poppins';
}

class AppStyles {
  static TextStyle h1 = TextStyle(
      fontFamily: FontFamily.poppins, fontSize: 40, color: Color(0xffEAF0FF));
  static TextStyle h2 = TextStyle(
    fontFamily: FontFamily.poppins,
    color: Color(0xffEAF0FF),
    fontSize: 32,
  );
  static TextStyle h3 = TextStyle(
    fontFamily: FontFamily.poppins,
    color: Color(0xffEAF0FF),
    fontSize: 24,
  );
  static TextStyle h4 = TextStyle(
    fontFamily: FontFamily.poppins,
    color: Color(0xffEAF0FF),
    fontSize: 16,
  );
  static TextStyle h5 = TextStyle(
    fontFamily: FontFamily.poppins,
    color: Color(0xffEAF0FF),
    fontSize: 14,
  );
}
