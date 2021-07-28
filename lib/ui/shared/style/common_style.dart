import 'package:flutter/material.dart';
import 'package:quiz_app/ui/shared/theme_color.dart';

class CommonStyle {
  CommonStyle._();

  static BoxShadow boxShadow1 = BoxShadow(
      color: ThemeColor.black.withOpacity(0.15),
      blurRadius: 10.0,
      offset: Offset(0.0, 5.0));

  static BoxShadow boxShadow2 = BoxShadow(
      color: ThemeColor.black.withOpacity(0.03),
      blurRadius: 10.0,
      offset: Offset(0.0, 2.0));
}
