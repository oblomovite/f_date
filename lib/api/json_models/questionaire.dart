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
    this.questionaires,
  });

  final List<QuestionaireElement> questionaires;

  // factory Questionaire.fromJson(Map<String, dynamic> json) => Questionaire(
  //     questionaires: List<QuestionaireElement>.from(json["questionaires"].map((x) => QuestionaireElement.fromJson(x))),
  // );
  //
  // Map<String, dynamic> toJson() => {
  //     "questionaires": List<dynamic>.from(questionaires.map((x) => x.toJson())),
  // };

  factory Questionaire.fromJson(Map<String, dynamic> json) =>
      _$QuestionaireFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionaireToJson(this);
}

// @JsonSerializable(
//   explicitToJson: true
// )
// class Questionaire {
//   @JsonKey(name: 'questionaires')
//   List<QuestionaireElement> questionaires;
//
//   Questionaire({
//     this.questionaires,
//   });
//
//   factory Questionaire.fromJson(Map<String, dynamic> json) =>
//       _$QuestionaireFromJson(json);
//
//   Map<String, dynamic> toJson() => _$QuestionaireToJson(this);
// }

@JsonSerializable(
  anyMap: true
)
class QuestionaireElement {
  QuestionaireElement({
    this.content,
    this.title,
  });

  final List<Content> content;
  final String title;

  // factory QuestionaireElement.fromJson(Map<String, dynamic> json) => QuestionaireElement(
  //     content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
  //     title: json["title"],
  // );

  // Map<String, dynamic> toJson() => {
  //     "content": List<dynamic>.from(content.map((x) => x.toJson())),
  //     "title": title,
  // };

  factory QuestionaireElement.fromJson(Map<String, dynamic> json) =>
      _$QuestionaireElementFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionaireElementToJson(this);
}

@JsonSerializable(
  anyMap: true
)
class Content {
  Content({
    this.responses,
    this.prompt,
  });

  final List<String> responses;
  final String prompt;

  // factory Content.fromJson(Map<String, dynamic> json) => Content(
  //     responses: List<String>.from(json["responses"].map((x) => x)),
  //     prompt: json["prompt"],
  // );
  //
  // Map<String, dynamic> toJson() => {
  //     "responses": List<dynamic>.from(responses.map((x) => x)),
  //     "prompt": prompt,
  // };

  factory Content.fromJson(Map<dynamic, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

// @JsonSerializable()
// class GenericCollection<T> {
//   @JsonKey(name: 'page')
//   final int? page;
// 
//   @JsonKey(name: 'total_results')
//   final int? totalResults;
// 
//   @JsonKey(name: 'total_pages')
//   final int? totalPages;
// 
//   @JsonKey(name: 'results')
//   @_Converter()
//   final List<T>? results;
// 
//   GenericCollection({
//     this.page,
//     this.totalResults,
//     this.totalPages,
//     this.results,
//   });
// 
//   factory GenericCollection.fromJson(Map<String, dynamic> json) =>
//       _$GenericCollectionFromJson<T>(json);
// 
//   Map<String, dynamic> toJson() => _$GenericCollectionToJson(this);
// }
// 
// class _Converter<T> implements JsonConverter<T, Object?> {
//   const _Converter();
// 
//   @override
//   T fromJson(Object? json) {
//     if (json is Map<String, dynamic> &&
//         json.containsKey('name') &&
//         json.containsKey('size')) {
//       return CustomResult.fromJson(json) as T;
//     }
//     // This will only work if `json` is a native JSON type:
//     //   num, String, bool, null, etc
//     // *and* is assignable to `T`.
//     return json as T;
//   }
// 
//   @override
//   Object? toJson(T object) {
//     // This will only work if `object` is a native JSON type:
//     //   num, String, bool, null, etc
//     // Or if it has a `toJson()` function`.
//     return object;
//   }
// }
// 
// @JsonSerializable()
// class CustomResult {
//   final String name;
//   final int size;
// 
//   CustomResult(this.name, this.size);
// 
//   factory CustomResult.fromJson(Map<String, dynamic> json) =>
//       _$CustomResultFromJson(json);
// 
//   Map<String, dynamic> toJson() => _$CustomResultToJson(this);
// 
//   @override
//   bool operator ==(Object other) =>
//       other is CustomResult && other.name == name && other.size == size;
// 
//   @override
//   int get hashCode => name.hashCode * 31 ^ size.hashCode;
// }
  
