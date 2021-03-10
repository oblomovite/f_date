import 'package:f_date/api/json_models/questionaire.dart';
import 'package:f_date/api/json_parsers/json_parser.dart';

/*
Since our parsers are often going to use jsonDecode(), we want to 
avoid code duplication among classes - so a mixin is used.
*/

class QuestionaireParser extends JsonParser<List<QuestionaireElement>>
    with ListDecoder<List<QuestionaireElement>> {

  const QuestionaireParser();

    @override
    Future<List<QuestionaireElement>> parseFromJson(String json) async {

      final parsed = decodeJsonList(json).cast<Map<String, dynamic>>();
      return parsed.map<QuestionaireElement>((element) => QuestionaireElement.fromJson(element)).toList();

      // return Questionaire.fromJson(decodeJsonObject(json));
          // .map((value) => Questionaire.fromJson(value as Map<String, dynamic>))
          // .toList();
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
