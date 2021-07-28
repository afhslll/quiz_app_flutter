import 'package:flutter/material.dart';
import 'package:quiz_app/ui/shared/style/ubuntu_style.dart';
import 'package:quiz_app/ui/shared/theme_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Home Screen',
        style: UbuntuStyle.h3.copyWith(color: ThemeColor.primary),
      ),
    );
  }
}
