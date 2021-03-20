import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserProfile {
  @JsonKey(required: true)
  final String id;

  @JsonKey(includeIfNull: false)
  final String email;

  @JsonKey(includeIfNull: false)
  final String phoneNumber;

  /// ::TOOD:: need to figure out how to store user images
  /// Uint8List is the dart equivalent of byte[]
  final List<Uint8List> profilePictures;

  UserProfile({
    this.id,
    this.email,
    this.phoneNumber,
    this.profilePictures,
  });
}
