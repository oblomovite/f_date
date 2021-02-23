// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Questionaire _$QuestionaireFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id']);
  return Questionaire(
    json['id'] as int,
    json['title'] as String ?? '',
    (json['questions'] as List)
            ?.map((e) => e == null
                ? null
                : Questions.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$QuestionaireToJson(Questionaire instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'questions': instance.questions?.map((e) => e?.toJson())?.toList(),
    };
