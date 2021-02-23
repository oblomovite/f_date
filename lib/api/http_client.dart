import 'package:f_date/api/json_parsers/json_parser.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';



class RequestREST {
  final String endpoint;
  final Map<String, String> data;

  const RequestREST({@required this.endpoint, this.data = const {}});

  /// HTTP dio client
  /// The client is -static- because these settings won't change
  static final _client = Dio(BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
      connectTimeout: 3000, // 3 seconds
      receiveTimeout: 3000, // 3 seconds
      headers: <String, String>{
        "api-key": "add_one_if_needed",

// https://firebasestorage.googleapis.com/v0/b/f-date.appspot.com/o/mb-personality.json?alt=media&token=67264edd-9796-48c2-9c77-3759bc6a4531

      }));

  Future<T> executeGet<T>(JsonParser<T> parser) async {
    final response = await _client.get<String>(endpoint);
    return parser.parseFromJson(response.data);
  }

  Future<T> executePost<T>(JsonParser<T> parser) async {
    final formData = FormData.fromMap(data);
    final response = await _client.post<String>(endpoint, data: formData);
    return parser.parseFromJson(response.data);
  }
}
