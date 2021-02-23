import 'package:f_date/api/json_models/questionaire.dart';
import 'package:f_date/api/json_parsers/json_parser.dart';

/*
Since our parsers are often going to use jsonDecode(), we want to 
avoid code duplication among classes - so a mixin is used.
*/

import 'dart:convert';

class QuestionaireParser extends JsonParser<List<Questionaire>>
    with ListDecoder<List<Questionaire>> {
  const QuestionaireParser();

  /// This may not cut it since I have an inner object
  @override
  Future<List<Questionaire>> parseFromJson(String json) async {
    // return jsonDecode(json);
    /// Try this first -- if it doesn't decode properly, try above
    return decodeJsonList(json)
    .map((value) =>
      Questionaire.fromJson(
        value as Map <String, dynamic>
    )).toList();
  }
}

// class QuestionaireParser extends JsonParser<Questionaire>
//     with ObjectDecoder<Questionaire> {
//   const QuestionaireParser();
//
//   @override
//   Future<Questionaire> parseFromJson(String json) async {
//     final decoded = decodeJsonObject(json);
//     return Questionaire.fromJson(decoded);
//   }
// }
