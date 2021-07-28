import 'package:quiz_app/core/enum/question_type.dart';
import 'package:quiz_app/core/model/question_info.dart';
import 'package:quiz_app/core/viewmodel/base_model.dart';

class QuizViewModel extends BaseModel {
  List<QuestionInfo> _questions = [
    QuestionInfo(
      text:
          'What will you do in a party? (eg: Engage strangers, Initiate conversation etc.) Cannot exceed 5 sentences or 50 words.',
      type: QuestionType.subjective,
      maxSentence: 5,
      maxWord: 50,
    ),
    QuestionInfo(
      text: 'What will you do when a phone rings?',
      type: QuestionType.radio,
      answers: ['Rush to answer it first', 'Hope someone else will answer'],
    ),
    QuestionInfo(
        text:
            'Please choose from the below options what you think represents you? (Pick at least 3)',
        type: QuestionType.checkbox,
        answers: [
          'A realistic person',
          'A speculative person',
          'A practical sort of person',
          'A fanciful sort of person',
          'A strong sense of reality',
          'A vivid imagination'
        ],
        minSelect: 3),
  ];
  List<QuestionInfo> get questions => _questions;

  bool _showSubmitButton = false;
  bool get showSubmitButton => _showSubmitButton;

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
    final currentSentence = value.split(RegExp(r'[.!?]')).length;
    final currentWord = value.split(' ').length;
    final questionInfo = _questions[_currentIndex];
    _questions[_currentIndex].userAnswers = [];
    _questions[_currentIndex].userAnswers!.add(value);
    if (value == '' ||
        (questionInfo.maxSentence != null &&
            currentSentence > questionInfo.maxSentence!.toInt()) ||
        (questionInfo.maxWord != null &&
            currentWord > questionInfo.maxWord!.toInt())) {
      _questions[_currentIndex].isCompleted = false;
    } else {
      _questions[_currentIndex].isCompleted = true;
    }
    _isAllComplete();
  }

  void answerRadio(int value) {
    if (_questions[_currentIndex].userAnswers == null) {
      _questions[_currentIndex].userAnswers = [];
      _questions[_currentIndex].userAnswers!.add(value);
    } else {
      _questions[_currentIndex].userAnswers![0] = value;
    }
    _questions[_currentIndex].isCompleted = true;
    _isAllComplete();
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
    _isAllComplete();
  }

  void _isAllComplete() {
    final idx = _questions.indexWhere((q) => q.isCompleted == false);
    if (idx == -1) {
      _showSubmitButton = true;
    } else {
      _showSubmitButton = false;
    }
    notifyListeners();
  }
}
