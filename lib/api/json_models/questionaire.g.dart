// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Questionaire _$QuestionaireFromJson(Map<String, dynamic> json) {
  return Questionaire(
    questionaires: (json['questionaires'] as List)
        ?.map((e) => e == null
            ? null
            : QuestionaireElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$QuestionaireToJson(Questionaire instance) =>
    <String, dynamic>{
      'questionaires': instance.questionaires,
    };

QuestionaireElement _$QuestionaireElementFromJson(Map<String, dynamic> json) {
  return QuestionaireElement(
    title: json['title'] as String,
    questions: (json['questions'] as List)
        ?.map((e) =>
            e == null ? null : Question.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$QuestionaireElementToJson(
        QuestionaireElement instance) =>
    <String, dynamic>{
      'title': instance.title,
      'questions': instance.questions,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
    prompt: json['prompt'] as String,
    responses: (json['responses'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'prompt': instance.prompt,
      'responses': instance.responses,
    };
