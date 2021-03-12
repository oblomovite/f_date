// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Questionaire _$QuestionaireFromJson(Map json) {
  return Questionaire(
    questionaires: (json['questionaires'] as List)
        ?.map((e) => e == null
            ? null
            : QuestionaireElement.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
  );
}

Map<String, dynamic> _$QuestionaireToJson(Questionaire instance) =>
    <String, dynamic>{
      'questionaires': instance.questionaires,
    };

QuestionaireElement _$QuestionaireElementFromJson(Map json) {
  return QuestionaireElement(
    content: (json['content'] as List)
        ?.map((e) => e == null ? null : Content.fromJson(e as Map))
        ?.toList(),
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$QuestionaireElementToJson(
        QuestionaireElement instance) =>
    <String, dynamic>{
      'content': instance.content,
      'title': instance.title,
    };

Content _$ContentFromJson(Map json) {
  return Content(
    responses: (json['responses'] as List)?.map((e) => e as String)?.toList(),
    prompt: json['prompt'] as String,
  );
}

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'responses': instance.responses,
      'prompt': instance.prompt,
    };
