/*

Example Post Json Parser
*/

import 'package:f_date/api/json_models/post.dart';
import 'package:f_date/api/json_parsers/json_parser.dart';

class PostParser extends JsonParser<Post> with ObjectDecoder<Post> {
  const PostParser();

  @override
  Future<Post> parseFromJson(String json) async {
    final decoded = decodeJsonObject(json);
    return Post.fromJson(decoded);
  }
}
