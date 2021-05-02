import 'dart:async';
import 'dart:convert';

typedef dynamic ParseJsonData(Map<dynamic, dynamic> jsonObject);

enum HttpMethod {
  Post, Get, Put, Delete,
}

class RequestHelper {
  RequestHelper._();
}