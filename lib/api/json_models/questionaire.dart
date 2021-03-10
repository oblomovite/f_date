import 'package:json_annotation/json_annotation.dart';
part 'questionaire.g.dart';

/*
Questionaire Model to be inflated from Firestore database
*/
@JsonSerializable(
  explicitToJson: true
)
class Questionaire {
  @JsonKey(name: 'questionaires')
  List<QuestionaireElement> questionaires;

  Questionaire({
    this.questionaires,
  });

  factory Questionaire.fromJson(Map<String, dynamic> json) =>
      _$QuestionaireFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionaireToJson(this);
}


@JsonSerializable(
  explicitToJson: true
)
class QuestionaireElement {

  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'questions')
  List<Question> questions;

  QuestionaireElement({
    this.title,
    this.questions,
  });

  factory QuestionaireElement.fromJson(Map<String, dynamic> json) =>
      _$QuestionaireElementFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionaireElementToJson(this);
}

@JsonSerializable()
class Question {

  @JsonKey(name: 'prompt')
  String prompt;
  @JsonKey(name: 'responses')
  List<String> responses;

  Question({
    this.prompt,
    this.responses,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
