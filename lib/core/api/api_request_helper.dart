import 'dart:convert';

import 'package:bike_store_admin_flutter/app/app_constants.dart';
import 'package:bike_store_admin_flutter/core/api/api_response_codes.dart';
import 'package:bike_store_admin_flutter/core/api/models/api_response.dart';
import 'package:http/http.dart' as http;

typedef T ParseJsonData<T>(Map<dynamic, dynamic> jsonObject);

enum HttpMethod {
  Post, Get, Put, Delete,
}

class ApiRequestHelper {

  ApiRequestHelper._();

  static Future<ApiResponse> get(String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    ParseJsonData? parseJsonData,
  }) async {
    return _request(path,
      method: HttpMethod.Get,
      headers: headers,
      queryParameters: queryParameters,
      parseJsonData: parseJsonData,
    );
  }

  static Future<ApiResponse> post(String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    ParseJsonData? parseJsonData,
  }) async {
    return _request(path,
      method: HttpMethod.Post,
      headers: headers,
      queryParameters: queryParameters,
      parseJsonData: parseJsonData,
    );
  }

  static Future<ApiResponse> _request(String path, {
    HttpMethod? method,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    ParseJsonData? parseJsonData,
  }) async {
    try {
      var body;

      final query = _getQueryString(queryParameters);
      final uri = Uri.parse(kApiServiceUrl + path + query);

      final response = await _sendRequest(method, uri);
      print('Response: status=${response.statusCode}');

      final resBody = _parseResBody(response.body);
      if (resBody != null && parseJsonData != null) {
        body = parseJsonData(resBody);
      }

      return ApiResponse(
        code: API_SUCCESS,
        result: body ?? response.body,
      );
    } catch(e) {
      // TODO: ...
      rethrow;
    }
  }

  static Future<http.Response> _sendRequest(HttpMethod? method, Uri uri) async {
    switch (method) {
      case HttpMethod.Get:
        return http.get(uri);
      case HttpMethod.Post:
        return http.post(uri);
      case HttpMethod.Delete:
      case HttpMethod.Put:
      default:
        throw Exception('');
    }
  }

  static String _getQueryString(Map<String, dynamic>? queryParameters) {
    if (queryParameters == null || queryParameters.isEmpty) {
      return '';
    } else {
      return '?' + queryParameters.entries.map((e) => '${e.key}=${e.value}').join('&');
    }
  }

  static Map<String, dynamic>? _parseResBody(String body) {
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


