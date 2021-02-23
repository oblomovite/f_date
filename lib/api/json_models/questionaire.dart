import 'package:f_date/api/json_models/questions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'questionaire.g.dart';


/*
Model for question list to be retrieved from Firebase
*/

// necessary since we rely on another class to represent the JSON here
@JsonSerializable(explicitToJson: true)
class Questionaire {
  @JsonKey(required: true)
  final int id;


  // Just in case the values are not initialized correctly
  @JsonKey(defaultValue: "")
  final String title;
  // Just in case the values are not initialized correctly
  @JsonKey(defaultValue: [])
  final List<Questions> questions;

  const Questionaire(
    this.id,
    this.title,
    this.questions,
  );

  factory Questionaire.fromJson(Map<String, dynamic> json) =>
      _$QuestionaireFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionaireToJson(this);
}

