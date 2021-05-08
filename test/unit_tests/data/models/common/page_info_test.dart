import 'dart:convert';

import 'package:bike_store_admin_flutter/data/models/common/page_info.dart';
import 'package:test/test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  test('parse json', () {
    final pageInfo = PageInfo.fromJson(json.decode(fixture('common/page_info.json')));

    expect(pageInfo.size, 10);
    expect(pageInfo.page, 3);
    expect(pageInfo.dataCount, 10);
    expect(pageInfo.totalPages, 33);
    expect(pageInfo.totalDataCount, 321);
  });
}