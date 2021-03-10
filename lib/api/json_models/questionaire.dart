import 'package:json_annotation/json_annotation.dart';
part 'questionaire.g.dart';

/*
Questionaire Model to be inflated from Firestore database
*/
@JsonSerializable(
  // explicitToJson: true
)
class Questionaire {
  List<QuestionaireElement> questionaires;

  Questionaire({
    this.questionaires,
  });

  factory Questionaire.fromJson(Map<String, dynamic> json) =>
      _$QuestionaireFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionaireToJson(this);
}

@JsonSerializable()
class QuestionaireElement {

  String title;
  List<Question> questions;

  QuestionaireElement({
    this.title,
    this.questions,
  });

  // factory QuestionaireElement.fromJson(Map<String, dynamic> json) =>

  factory QuestionaireElement.fromJson(Map<dynamic, dynamic> json) =>
      _$QuestionaireElementFromJson(json);

  // Map<String, dynamic> toJson() => _$QuestionaireElementToJson(this);

  Map<dynamic, dynamic> toJson() => _$QuestionaireElementToJson(this);
}

@JsonSerializable()
class Question {

  String prompt;
  List<String> responses;

  Question({
    this.prompt,
    this.responses,
  });

  // factory Question.fromJson(Map<String, dynamic> json) =>
  factory Question.fromJson(Map<dynamic, dynamic> json) =>
      _$QuestionFromJson(json);

  // Map<String, dynamic> toJson() => _$QuestionToJson(this);
  Map<dynamic, dynamic> toJson() => _$QuestionToJson(this);
}
