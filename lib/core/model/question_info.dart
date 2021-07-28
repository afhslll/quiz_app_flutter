class QuestionInfo {
  String? text;
  int? point;
  List<AnswerInfo>? answers;
  List<String>? correctAnswers;

  QuestionInfo({
    this.text,
    this.point,
    this.answers,
    this.correctAnswers,
  });
}

class AnswerInfo {
  String? text;
  bool? isSelected;

  AnswerInfo({this.text, this.isSelected});
}
