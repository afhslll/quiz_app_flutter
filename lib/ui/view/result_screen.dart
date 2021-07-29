import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/measurement_constant.dart';
import 'package:quiz_app/core/constant/path_constant.dart';
import 'package:quiz_app/ui/shared/style/common_style.dart';
import 'package:quiz_app/ui/shared/style/roboto_style.dart';
import 'package:quiz_app/ui/shared/style/ubuntu_style.dart';
import 'package:quiz_app/ui/shared/theme_color.dart';
import 'package:quiz_app/ui/widget/wrap_chip.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.lightestGrey,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(ConstantMeasurement.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SafeArea(
              bottom: false,
              child: _buildReportView(context: context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportView({BuildContext? context}) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [CommonStyle.boxShadow2],
        borderRadius:
            BorderRadius.circular(ConstantMeasurement.mediumBorderRadius),
        color: ThemeColor.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Your Personality Report',
              style: UbuntuStyle.h3.copyWith(color: ThemeColor.black),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
              height: 1,
              thickness: 0.5,
              color: ThemeColor.grey.withOpacity(0.3)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          ConstantMeasurement.smallBorderRadius),
                      child: Image.asset(
                        ConstantAssetsString.astronaut,
                        height: MediaQuery.of(context!).size.width / 3.4,
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Personality type:',
                            style: RobotoStyle.caption
                                .copyWith(color: ThemeColor.grey),
                          ),
                          Text(
                            'Explorer',
                            style: UbuntuStyle.h2
                                .copyWith(color: ThemeColor.primary),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          WrapChip(
                            items: [
                              'Innovative',
                              'Open-minded',
                              'Optmistic',
                              'Informal'
                            ],
                            backgroundColor: ThemeColor.lightestGrey,
                            textColor: ThemeColor.black,
                          )
                        ],
                      ),
                    ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Explorers are people who like to approach life in their own way, being open to new experiences and ready to try new things. Explorers don't feel constrained by tradition or convention, and they have a quick-thinking and open-minded attitude. People like this are generally positive in outlook, and take a broader view of things rather than focusing on minor details.",
                    style: RobotoStyle.body2
                        .copyWith(color: ThemeColor.black, height: 1.5),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
