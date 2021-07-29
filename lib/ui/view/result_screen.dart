import 'package:flutter/material.dart';
import 'package:quiz_app/core/argument/result_argument.dart';
import 'package:quiz_app/core/constant/measurement_constant.dart';
import 'package:quiz_app/core/constant/path_constant.dart';
import 'package:quiz_app/core/enum/question_type.dart';
import 'package:quiz_app/core/model/question_info.dart';
import 'package:quiz_app/core/router/router.dart';
import 'package:quiz_app/core/service/locator/locator.dart';
import 'package:quiz_app/core/service/navigation/navigation_service.dart';
import 'package:quiz_app/ui/shared/style/common_style.dart';
import 'package:quiz_app/ui/shared/style/roboto_style.dart';
import 'package:quiz_app/ui/shared/style/ubuntu_style.dart';
import 'package:quiz_app/ui/shared/theme_color.dart';
import 'package:quiz_app/ui/widget/rounded_button.dart';
import 'package:quiz_app/ui/widget/wrap_chip.dart';

class ResultScreen extends StatelessWidget {
  final ResultArgument? arguments;
  ResultScreen({Key? key, this.arguments}) : super(key: key);
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.lightestGrey,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(ConstantMeasurement.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SafeArea(
                    bottom: false,
                    child: _buildReportView(context: context),
                  ),
                  _buildAnswersView(),
                ],
              ),
            ),
          ),
          RoundedButton(
              buttonColor: ThemeColor.primary,
              buttonText: 'Back to Home',
              textColor: ThemeColor.white,
              onTap: () {
                _navigationService
                    .pushAndRemoveUntil(NavigationRouter.homeRoute);
              }),
        ],
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
                            items: const [
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
                    style: RobotoStyle.body1
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

  Widget _buildAnswersView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Your answers',
            style: UbuntuStyle.h3.copyWith(color: ThemeColor.black),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [CommonStyle.boxShadow2],
              borderRadius:
                  BorderRadius.circular(ConstantMeasurement.mediumBorderRadius),
              color: ThemeColor.white,
            ),
            padding: EdgeInsets.all(ConstantMeasurement.screenPadding),
            child: ListView.separated(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) => _buildAnswerItem(
                    index: index, questionInfo: arguments!.questions![index]),
                separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Divider(
                          height: 1,
                          thickness: 0.5,
                          color: ThemeColor.grey.withOpacity(0.3)),
                    ),
                itemCount: 3),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerItem({int? index, QuestionInfo? questionInfo}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 30,
          width: 30,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(ConstantMeasurement.smallBorderRadius),
            color: ThemeColor.primary,
          ),
          child: Center(
            child: Text(
              (index! + 1).toString(),
              style: UbuntuStyle.button2.copyWith(color: ThemeColor.white),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                questionInfo?.text ?? '',
                style: UbuntuStyle.button1
                    .copyWith(color: ThemeColor.black, height: 1.3),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: _buildUserAnswer(questionInfo!),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUserAnswer(QuestionInfo questionInfo) {
    if (questionInfo.type == QuestionType.subjective) {
      return _buildSingleText(questionInfo.userAnswers?.first ?? '');
    } else {
      if (questionInfo.userAnswers!.length > 1) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(
            questionInfo.userAnswers!.length,
            (index) => Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                '· ${questionInfo.answers![questionInfo.userAnswers![index].toInt()]}',
                style: RobotoStyle.body1.copyWith(color: ThemeColor.primary),
              ),
            ),
          ),
        );
      }
      return _buildSingleText(
          questionInfo.answers![questionInfo.userAnswers!.first.toInt()]);
    }
  }

  Widget _buildSingleText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
        text,
        style: RobotoStyle.body1.copyWith(color: ThemeColor.primary),
      ),
    );
  }
}
