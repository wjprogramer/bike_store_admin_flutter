import 'dart:convert';

import 'package:bike_store_admin_flutter/data/models/production/brand.dart';
import 'package:test/test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  test('parse json', () {
    final brand = Brand.fromJson(json.decode(fixture('production/brand.json')));

    expect(brand.id, '1');
    expect(brand.name, 'Electra');
    expect(brand.isDeleted, false);
  });

  test('parse json list', () {
    final data = json.decode(fixture('production/brand_list.json'))['result']['data'];

    expect(data is List<dynamic>, true);
    expect(data.length, 9);
  });
}