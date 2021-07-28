import 'package:quiz_app/core/model/question_info.dart';
import 'package:quiz_app/core/viewmodel/base_model.dart';

class QuizViewModel extends BaseModel {
  List<QuestionInfo> _questions = [
    QuestionInfo(text: '1+2=?', answers: [
      AnswerInfo(text: '1'),
      AnswerInfo(text: '2'),
      AnswerInfo(text: '3'),
      AnswerInfo(text: '4'),
    ], correctAnswers: [
      '3'
    ]),
    QuestionInfo(text: '1+2=?', answers: [
      AnswerInfo(text: '1'),
      AnswerInfo(text: '2'),
      AnswerInfo(text: '3'),
      AnswerInfo(text: '4'),
    ], correctAnswers: [
      '3'
    ]),
    QuestionInfo(text: '1+2=?', answers: [
      AnswerInfo(text: '1'),
      AnswerInfo(text: '2'),
      AnswerInfo(text: '3'),
      AnswerInfo(text: '4'),
    ], correctAnswers: [
      '3'
    ]),
  ];
  List<QuestionInfo> get questions => _questions;

  bool _showSubmitButton = false;
  bool get showSubmitButton => _showSubmitButton;

  int _points = 0;
  int get points => _points;

  int _correctAnswerCount = 0;
  int get correctAnswerCount => _correctAnswerCount;

  Future<void> setupPage() async {}

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int value) {
    if (_currentIndex != value) {
      _currentIndex = value;
      notifyListeners();
    }
  }

  void selectAnswer(int answerIndex) {
    _questions[_currentIndex]
        .answers!
        .map((value) => value.isSelected = false)
        .toList();
    _questions[_currentIndex].answers?[answerIndex].isSelected = true;
    bool isAllAnswered = true;
    _showSubmitButton = isAllAnswered;
    notifyListeners();
  }

  Future<void> submitResult() async {}
}
