import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/measurement_constant.dart';
import 'package:quiz_app/core/constant/path_constant.dart';
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
      backgroundColor: ThemeColor.babyBlue,
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
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            ConstantAssetsString.astronaut,
            height: 300,
          ),
          Text(
            'Explore Your Personality',
            style: UbuntuStyle.h2.copyWith(color: ThemeColor.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
