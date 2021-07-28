import 'package:quiz_app/core/enum/question_type.dart';

class QuestionInfo {
  String? text;
  int? point;
  QuestionType? type;
  List<String>? answers;
  List<String>? correctAnswers;
  List<dynamic>? userAnswers;
  bool? isError;
  int? minSelect;
  int? maxSelect;
  bool isCompleted;

  QuestionInfo({
    this.text,
    this.point,
    this.type,
    this.answers,
    this.correctAnswers,
    this.userAnswers,
    this.isError,
    this.minSelect,
    this.maxSelect,
    this.isCompleted = false,
  });
}
