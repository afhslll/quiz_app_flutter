import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/measurement_constant.dart';
import 'package:quiz_app/core/router/router.dart';
import 'package:quiz_app/core/service/locator/locator.dart';
import 'package:quiz_app/core/service/navigation/navigation_service.dart';
import 'package:quiz_app/ui/shared/style/ubuntu_style.dart';
import 'package:quiz_app/ui/shared/theme_color.dart';
import 'package:quiz_app/ui/widget/rounded_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: _buildHighScoreView(),
            ),
            RoundedButton(
              buttonText: 'Start',
              onTap: () {
                _navigationService.navigateTo(NavigationRouter.quizRoute);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHighScoreView() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(ConstantMeasurement.smallBorderRadius),
        color: ThemeColor.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Your High Score',
            style: UbuntuStyle.h3.copyWith(color: ThemeColor.black),
            textAlign: TextAlign.center,
          ),
          Text(
            '76',
            style: UbuntuStyle.h1.copyWith(color: ThemeColor.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
