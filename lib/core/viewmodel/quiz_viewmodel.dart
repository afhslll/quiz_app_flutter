import 'package:quiz_app/core/enum/question_type.dart';
import 'package:quiz_app/core/model/question_info.dart';
import 'package:quiz_app/core/viewmodel/base_model.dart';

class QuizViewModel extends BaseModel {
  List<QuestionInfo> _questions = [
    QuestionInfo(
        text: '1+2=?',
        type: QuestionType.radio,
        answers: ['1', '2', '3', '4'],
        correctAnswers: ['3']),
    QuestionInfo(
        text: '1+2=?',
        type: QuestionType.checkbox,
        answers: ['1', '2', '3', '4'],
        correctAnswers: ['3'],
        minSelect: 3),
    QuestionInfo(
        text: '1+2=?', type: QuestionType.subjective, correctAnswers: ['3']),
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

  void answerSubjective(String value) {
    _questions[_currentIndex].isCompleted = true;
    notifyListeners();
  }

  void answerRadio(int value) {
    if (_questions[_currentIndex].userAnswers == null) {
      _questions[_currentIndex].userAnswers = [];
      _questions[_currentIndex].userAnswers!.add(value);
    } else {
      _questions[_currentIndex].userAnswers![0] = value;
    }
    _questions[_currentIndex].isCompleted = true;
    notifyListeners();
  }

  void answerCheckbox(List<int> value) {
    _questions[_currentIndex].userAnswers = [];
    _questions[_currentIndex].userAnswers!.addAll(value);
    final questionInfo = _questions[_currentIndex];
    if (questionInfo.minSelect != null &&
        value.length >= questionInfo.minSelect!.toInt()) {
      _questions[_currentIndex].isCompleted = true;
    } else {
      _questions[_currentIndex].isCompleted = false;
    }
    notifyListeners();
  }

  Future<void> submitResult() async {}
}
