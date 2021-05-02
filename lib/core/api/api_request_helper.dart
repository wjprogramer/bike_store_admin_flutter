import 'dart:convert';

import 'package:bike_store_admin_flutter/app/app_constants.dart';
import 'package:bike_store_admin_flutter/core/api/api_response_codes.dart';
import 'package:bike_store_admin_flutter/core/api/models/api_response.dart';
import 'package:http/http.dart' as http;

class ApiRequestHelper {

  ApiRequestHelper._();

  static Future<ApiResponse> get(String path, {
    Map<String, String> headers
  }) async {
    try {
      final uri = Uri.parse(kApiServiceUrl + path);
      final response = await http.get(uri);
      print('Response: status=${response.statusCode}');

      final resBody = response.body;
      final body = _parseResBody(resBody) ?? resBody;

      return ApiResponse(
        code: API_SUCCESS,
        result: body,
      );
    } catch(e) {
      // TODO: ...
      rethrow;
    }
  }

  static Map<String, dynamic> _parseResBody(String body) {
    try {
      var json = jsonDecode(body);
      if (json is! Map<String, dynamic>) {
        throw FormatException();
      }
      return json;
    } catch (_) {
      return null;
    }
  }

}


