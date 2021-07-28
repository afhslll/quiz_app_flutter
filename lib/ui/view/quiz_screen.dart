import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/core/constant/measurement_constant.dart';
import 'package:quiz_app/core/enum/view_state.dart';
import 'package:quiz_app/core/model/question_info.dart';
import 'package:quiz_app/core/service/locator/locator.dart';
import 'package:quiz_app/core/service/navigation/navigation_service.dart';
import 'package:quiz_app/core/viewmodel/quiz_viewmodel.dart';
import 'package:quiz_app/ui/shared/style/common_style.dart';
import 'package:quiz_app/ui/shared/style/roboto_style.dart';
import 'package:quiz_app/ui/shared/style/ubuntu_style.dart';
import 'package:quiz_app/ui/shared/theme_color.dart';
import 'package:quiz_app/ui/view/base_view.dart';
import 'package:quiz_app/ui/widget/rounded_button.dart';

class QuizScreen extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return BaseView<QuizViewModel>(
      onModelReady: (viewModel) async {},
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: ThemeColor.lightGrey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ThemeColor.lightGrey,
          leading: IconButton(
            onPressed: () => _navigationService.pop(),
            icon: Icon(Icons.close, color: ThemeColor.black, size: 30),
          ),
        ),
        body: Consumer<QuizViewModel>(
          builder: (context, viewModel, child) => viewModel.viewState ==
                  ViewState.busy
              ? Center(child: CircularProgressIndicator())
              : viewModel.questions.isEmpty
                  ? Center(
                      child: Text('No quiz found',
                          style: RobotoStyle.body2
                              .copyWith(color: ThemeColor.grey)))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildProgress(context: context, viewModel: viewModel),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        ConstantMeasurement.mediumBorderRadius),
                                    color: ThemeColor.white,
                                    boxShadow: [CommonStyle.boxShadow2]),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 20, 20, 16),
                                      child: Text(
                                        viewModel
                                                .questions[
                                                    viewModel.currentIndex]
                                                .text ??
                                            '',
                                        style: UbuntuStyle.h3
                                            .copyWith(height: 1.3),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 40),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: List.generate(
                                            viewModel
                                                    .questions[
                                                        viewModel.currentIndex]
                                                    .answers
                                                    ?.length ??
                                                0,
                                            (i) => _buildAnswerItem(
                                                label: i == 0
                                                    ? 'A'
                                                    : i == 1
                                                        ? 'B'
                                                        : i == 2
                                                            ? 'C'
                                                            : 'D',
                                                answerInfo: viewModel
                                                    .questions[
                                                        viewModel.currentIndex]
                                                    .answers![i],
                                                onTap: () {
                                                  viewModel.selectAnswer(i);
                                                })),
                                      ),
                                    ),
                                    _buildNavigation(viewModel: viewModel),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: viewModel.showSubmitButton,
                          child: RoundedButton(
                              isLoading: viewModel.viewState == ViewState.busy,
                              buttonColor: ThemeColor.blue,
                              buttonText: 'Submit',
                              onTap: () async {}),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }

  Widget _buildProgress({BuildContext? context, QuizViewModel? viewModel}) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
              'Question ${(viewModel?.currentIndex ?? 0) + 1}/${viewModel!.questions.length}',
              style: UbuntuStyle.button1),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: LinearProgressIndicator(
                value:
                    ((viewModel.currentIndex) + 1) / viewModel.questions.length,
                backgroundColor: ThemeColor.white,
                valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerItem(
      {String? label, Function()? onTap, AnswerInfo? answerInfo}) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 0.5,
                  color: answerInfo?.isSelected ?? false
                      ? ThemeColor.lightGrey
                      : ThemeColor.grey,
                ),
                color: answerInfo?.isSelected ?? false
                    ? ThemeColor.lightGrey
                    : ThemeColor.white),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        ConstantMeasurement.smallBorderRadius),
                    color: answerInfo?.isSelected ?? false
                        ? ThemeColor.blue
                        : ThemeColor.lightGrey,
                  ),
                  child: Center(
                    child: Text(
                      label ?? '',
                      style: UbuntuStyle.button2.copyWith(
                          color: answerInfo?.isSelected ?? false
                              ? ThemeColor.white
                              : ThemeColor.black),
                    ),
                  ),
                ),
                Expanded(
                    child: Text(answerInfo?.text ?? '',
                        style: UbuntuStyle.button2.copyWith(height: 1.3))),
              ],
            )),
      ),
    );
  }

  Widget _buildNavigation({QuizViewModel? viewModel}) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: viewModel!.currentIndex > 0
              ? InkWell(
                  onTap: () {
                    viewModel.currentIndex--;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                            ConstantMeasurement.mediumBorderRadius),
                      ),
                      color: ThemeColor.grey.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child:
                              Icon(Icons.chevron_left, color: ThemeColor.black),
                        ),
                        Text('Previous', style: UbuntuStyle.button2),
                      ],
                    ),
                  ),
                )
              : Container(),
        ),
        Expanded(
          flex: 1,
          child: viewModel.currentIndex < viewModel.questions.length - 1
              ? InkWell(
                  onTap: () {
                    viewModel.currentIndex++;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(
                            ConstantMeasurement.mediumBorderRadius),
                      ),
                      color: ThemeColor.blue,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Next',
                            style: UbuntuStyle.button2
                                .copyWith(color: ThemeColor.white)),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Icon(Icons.chevron_right,
                              color: ThemeColor.white),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ),
      ],
    );
  }
}
