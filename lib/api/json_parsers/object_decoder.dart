import 'dart:convert';

import 'package:f_date/api/json_parsers/json_parser.dart';

/*
Define some convenience decoders. 
These mixins are constrained (JsonParser<T>) so that only its subtypes 
will be able to use those methods.
*/

mixin ObjectDecoder<T> on JsonParser<T> {
  Map<String, dynamic> decodeJsonObject(String json) =>
      jsonDecode(json) as Map<String, dynamic>;
}

mixin ListDecoder<T> on JsonParser<T> {
  List<dynamic> decodeJsonList(String json) =>
      jsonDecode(json) as List<dynamic>;
}
