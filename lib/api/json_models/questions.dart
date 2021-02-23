import 'package:json_annotation/json_annotation.dart';

part 'questions.g.dart';

/*
Model for Questions used in Questionaire
*/
@JsonSerializable()
class Questions {

  @JsonKey(defaultValue: "")
  final String title;

  @JsonKey(defaultValue: [])
  final List<String> selections;

  const Questions(
    this.title,
    this.selections,
  );

  factory Questions.fromJson(Map<String, dynamic> json) =>
      _$QuestionsFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsToJson(this);
}
