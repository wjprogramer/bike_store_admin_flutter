import 'package:bike_store_admin_flutter/navigation/my_route_config.dart';
import 'package:test/test.dart';

void main() {
  group('Check properties', () {
    test('Home', () {
      final config = MyRouteConfig.home();
      expect(config.uri.path, '/');
      expect(config.isHome, true);
      expect(config == MyRouteConfig.home(), true);
    });

    test('Brand list', () {
      final config = MyRouteConfig.brandList();
      expect(config.uri.path, '/brands');
      expect(config.isBrandList, true);
      expect(config == MyRouteConfig.brandList(), true);
    });

    test('Product details', () {
      final productId = '1';
      final config = MyRouteConfig.productDetails(productId);
      expect(config.uri.path, '/product/$productId');
      expect(config.isProductDetail, true);
      expect(config == MyRouteConfig.productDetails(productId), true);
    });
  });
}