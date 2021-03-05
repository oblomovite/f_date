library json_parser;

export "questionaire_parser.dart";
// export "questions_parser.dart";

export "post_parser.dart";
export "object_decoder.dart";

abstract class JsonParser<T> {
  const JsonParser();

  Future<T> parseFromJson(String json);
}
