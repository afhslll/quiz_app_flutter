import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/core/constant/measurement_constant.dart';
import 'package:quiz_app/core/enum/question_type.dart';
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
import 'package:quiz_app/ui/widget/action_popup.dart';
import 'package:quiz_app/ui/widget/box_textfield.dart';
import 'package:quiz_app/ui/widget/checkbox_answer.dart';
import 'package:quiz_app/ui/widget/radio_answer.dart';
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
                                        child: _buildAnswerView(
                                            questionInfo: viewModel.questions[
                                                viewModel.currentIndex],
                                            viewModel: viewModel)),
                                    _buildNavigation(),
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
                              buttonColor: ThemeColor.primary,
                              buttonText: 'Submit',
                              onTap: () {
                                showActionDialog(
                                    context: context,
                                    titleText: 'Congratulations!',
                                    descriptionText:
                                        'You have completed the test. To view your result, you need to subscribe to a plan.',
                                    negativeText: 'No, thanks',
                                    positiveText: 'Subscribe',
                                    onTapNegative: () {
                                      _navigationService.pop();
                                    },
                                    onTapPositive: () {
                                      _navigationService.popToTop();
                                    });
                              }),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }

  Widget _buildAnswerView(
      {QuestionInfo? questionInfo, QuizViewModel? viewModel}) {
    switch (questionInfo!.type) {
      case QuestionType.subjective:
        return _buildSubjectiveView(
            questionInfo: questionInfo, viewModel: viewModel);
      case QuestionType.radio:
        return _buildRadioView(
            questionInfo: questionInfo, viewModel: viewModel);
      case QuestionType.checkbox:
        return _buildCheckboxView(
            questionInfo: questionInfo, viewModel: viewModel);
      default:
        return _buildSubjectiveView(
            questionInfo: questionInfo, viewModel: viewModel);
    }
  }

  Widget _buildSubjectiveView(
      {QuestionInfo? questionInfo, QuizViewModel? viewModel}) {
    return BoxTextField(
      initialValue: questionInfo?.userAnswers?.first ?? '',
      maxLines: 10,
      onChanged: (value) {
        viewModel!.answerSubjective(value);
      },
    );
  }

  Widget _buildRadioView(
      {QuestionInfo? questionInfo, QuizViewModel? viewModel}) {
    return RadioAnswer(
      answers: questionInfo!.answers,
      selectedIndex: questionInfo.userAnswers != null
          ? questionInfo.userAnswers![0]
          : null,
      onTap: (value) {
        viewModel!.answerRadio(value);
      },
    );
  }

  Widget _buildCheckboxView(
      {QuestionInfo? questionInfo, QuizViewModel? viewModel}) {
    return CheckboxAnswer(
      answers: questionInfo!.answers,
      selectedIndexes: questionInfo.userAnswers != null
          ? List.generate(questionInfo.userAnswers!.length,
              (index) => questionInfo.userAnswers![index].toInt())
          : null,
      onTap: (value) {
        viewModel!.answerCheckbox(value);
      },
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
                valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigation() {
    return Consumer<QuizViewModel>(
      builder: (context, viewModel, child) => Row(
        children: [
          Expanded(
            flex: 1,
            child: viewModel.currentIndex > 0
                ? InkWell(
                    onTap: () {
                      viewModel.currentIndex--;
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                              ConstantMeasurement.mediumBorderRadius),
                        ),
                        color: ThemeColor.grey.withOpacity(0.2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Icon(Icons.chevron_left,
                                color: ThemeColor.black),
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
            child: _showNextButton(viewModel: viewModel)
                ? InkWell(
                    onTap: () {
                      viewModel.currentIndex++;
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(
                              ConstantMeasurement.mediumBorderRadius),
                        ),
                        color: ThemeColor.primary,
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
      ),
    );
  }

  bool _showNextButton({QuizViewModel? viewModel}) {
    final questionInfo = viewModel!.questions[viewModel.currentIndex];
    final bool hasNext =
        viewModel.currentIndex < viewModel.questions.length - 1;
    if (hasNext && questionInfo.isCompleted) {
      return true;
    }
    return false;
  }
}
