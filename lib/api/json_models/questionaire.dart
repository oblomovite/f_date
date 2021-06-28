// import 'package:json_annotation/json_annotation.dart';
// part 'questionaire.g.dart';

/*
Questionaire Model to be inflated from Firestore database
*/

// To parse this JSON data, do
//
//     final questionaire = questionaireFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'questionaire.g.dart';

// Questionaire questionaireFromJson(String str) => Questionaire.fromJson(json.decode(str));
//
// String questionaireToJson(Questionaire data) => json.encode(data.toJson());

@JsonSerializable(
  anyMap: true
)
class Questionaire {
  Questionaire({
    required this.questionaires,
  });

  final List<QuestionaireElement> questionaires;

  factory Questionaire.fromJson(Map<String, dynamic> json) =>
      _$QuestionaireFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionaireToJson(this);
}

@JsonSerializable(
  anyMap: true
)
class QuestionaireElement {
  QuestionaireElement({
    required this.content,
    required this.title,
  });

  final List<Content> content;
  final String title;

  factory QuestionaireElement.fromJson(Map<String, dynamic> json) =>
      _$QuestionaireElementFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionaireElementToJson(this);
}

@JsonSerializable(
  anyMap: true
)
class Content {
  Content({
    required this.responses,
    required this.prompt,
  });

  final List<String> responses;
  final String prompt;

  factory Content.fromJson(Map<dynamic, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}
