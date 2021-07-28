import 'package:flutter/material.dart';

class UbuntuStyle {
  UbuntuStyle._();

  static TextStyle defaultStyle = const TextStyle(fontFamily: 'Ubuntu');

  static TextStyle display1 =
      defaultStyle.copyWith(fontSize: 48, fontWeight: FontWeight.w700);

  static TextStyle display2 =
      defaultStyle.copyWith(fontSize: 28, fontWeight: FontWeight.w700);

  static TextStyle h1 =
      defaultStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w700);

  static TextStyle h2 =
      defaultStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w700);

  static TextStyle h3 =
      defaultStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w700);

  static TextStyle h4 =
      defaultStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w700);

  static TextStyle appBarH3 = defaultStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static TextStyle subTitle = defaultStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle button1 =
      defaultStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle button2 =
      defaultStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500);

  static TextStyle button3 =
      defaultStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w500);

  static TextStyle button4 =
      defaultStyle.copyWith(fontSize: 10, fontWeight: FontWeight.w500);
}
