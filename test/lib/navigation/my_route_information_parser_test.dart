import 'package:bike_store_admin_flutter/navigation/my_route_config.dart';
import 'package:bike_store_admin_flutter/navigation/my_route_information_parser.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

void main() {
  final parser = MyRouteInformationParser();

  group('Parser route information', () {
    test('Home', () async {
      final routeInformation = RouteInformation(location: '/');
      final config = await parser.parseRouteInformation(routeInformation);

      expect(config.uri.path, '/');
      expect(config.isHome, true);
      expect(config == MyRouteConfig.home(), true);
    });

    test('Brand list', () async {
      final routeInformation = RouteInformation(location: '/brands');
      final config = await parser.parseRouteInformation(routeInformation);

      expect(config.uri.path, '/brands');
      expect(config.isBrandList, true);
      expect(config == MyRouteConfig.brandList(), true);
    });

    test('', () async {
      final productId = '1';
      final routeInformation = RouteInformation(location: '/product/$productId');
      final config = await parser.parseRouteInformation(routeInformation);

      expect(config.uri.path, '/product/$productId');
      expect(config.isProductDetail, true);
      expect(config == MyRouteConfig.productDetails(productId), true);
    });

  });

  group('Restore route information', () {
    // ...
  });

}