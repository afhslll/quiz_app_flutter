import 'package:quiz_app/core/enum/question_type.dart';

class QuestionInfo {
  String? text;
  int? point;
  QuestionType? type;
  List<String>? answers;
  List<dynamic>? userAnswers;
  bool? isError;
  int? minSelect;
  int? maxSentence;
  int? maxWord;
  bool isCompleted;

  QuestionInfo({
    this.text,
    this.point,
    this.type,
    this.answers,
    this.userAnswers,
    this.isError,
    this.minSelect,
    this.maxSentence,
    this.maxWord,
    this.isCompleted = false,
  });
}
