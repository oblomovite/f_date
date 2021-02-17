import 'package:json_annotation/json_annotation.dart';

part 'example.g.dart'

@JsonSerializable()
class Example {
  final int userId;
  final int id;
  final String title;
  bool completed;

  Example(this.userId, this.id, this.title, this.completed);

  factory Example.fromJson(Map<String, dynamic> json) => _$ExampleFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleToJson(this);
}
