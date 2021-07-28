import 'package:flutter/material.dart';

class RobotoStyle {
  RobotoStyle._();

  static TextStyle defaultStyle = const TextStyle(fontFamily: 'Roboto');

  static TextStyle subtitle1 = defaultStyle.copyWith(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15);

  static TextStyle subtitle2 = defaultStyle.copyWith(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1);

  static TextStyle body1 = defaultStyle.copyWith(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5);

  static TextStyle body2 = defaultStyle.copyWith(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25);

  static TextStyle body3 = defaultStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.5,
  );

  static TextStyle caption = defaultStyle.copyWith(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4);

  static TextStyle caption2 = defaultStyle.copyWith(
      fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.4);

  static TextStyle caption3 = defaultStyle.copyWith(
      fontSize: 10, fontWeight: FontWeight.w500, letterSpacing: 0.4);

  static TextStyle overLine = defaultStyle.copyWith(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 0.5);
}
