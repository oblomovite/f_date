// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Questions _$QuestionsFromJson(Map<String, dynamic> json) {
  return Questions(
    json['title'] as String ?? '',
    (json['selections'] as List)?.map((e) => e as String)?.toList() ?? [],
  );
}

Map<String, dynamic> _$QuestionsToJson(Questions instance) => <String, dynamic>{
      'title': instance.title,
      'selections': instance.selections,
    };
