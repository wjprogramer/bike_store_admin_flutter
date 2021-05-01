import 'package:bike_store_admin_flutter/navigation/my_route_config.dart';
import 'package:bike_store_admin_flutter/presentations/screens/brand_list/brand_list_screen.dart';
import 'package:bike_store_admin_flutter/presentations/screens/category_list/category_list_screen.dart';
import 'package:bike_store_admin_flutter/presentations/screens/customer_details/customer_details_screen.dart';
import 'package:bike_store_admin_flutter/presentations/screens/customer_list/customer_list_screen.dart';
import 'package:bike_store_admin_flutter/presentations/screens/home/home_screen.dart';
import 'package:bike_store_admin_flutter/presentations/screens/order_details/order_details_screen.dart';
import 'package:bike_store_admin_flutter/presentations/screens/order_list/order_list_screen.dart';
import 'package:bike_store_admin_flutter/presentations/screens/product_details/product_details_screen.dart';
import 'package:bike_store_admin_flutter/presentations/screens/product_list/product_list_screen.dart';
import 'package:bike_store_admin_flutter/presentations/screens/staff_details/staff_details_screen.dart';
import 'package:bike_store_admin_flutter/presentations/screens/staff_list/staff_list_screen.dart';
import 'package:bike_store_admin_flutter/presentations/screens/stock_list/stock_list_screen.dart';
import 'package:bike_store_admin_flutter/presentations/screens/store_details/store_details_screen.dart';
import 'package:bike_store_admin_flutter/presentations/screens/store_list/store_list_screen.dart';
import 'package:bike_store_admin_flutter/presentations/screens/unknown/unknown_screen.dart';
import 'package:flutter/material.dart';

extension _RouteParsing on List<String> {
  bool checkPathIs(MyRouteConfig config) =>
      RouteUtility.comparePathSegments(this, config.uri.pathSegments);
}

class RouteUtility {

  RouteUtility._();

  static MyRouteConfig getRouteConfig(RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location);
    final pathSegments = uri.pathSegments;
    final pathSegmentsCount = pathSegments.length;

    if (pathSegmentsCount == 0) {
      return MyRouteConfig.home();
    }

    if (pathSegmentsCount == 1) {
      var testedConfigs = [
        MyRouteConfig.brandList(),
        MyRouteConfig.categoryList(),
        MyRouteConfig.productList(),
        MyRouteConfig.stockList(),
        MyRouteConfig.customerList(),
        MyRouteConfig.orderList(),
        MyRouteConfig.staffList(),
        MyRouteConfig.storeList(),
      ];

      for (var config in testedConfigs) {
        if (pathSegments.checkPathIs(config)) {
          return config;
        }
      }
    }

    if (pathSegmentsCount == 2) {
      var id = pathSegments[1];
      if (pathSegments.checkPathIs(MyRouteConfig.productDetails(id))) {
        return MyRouteConfig.productDetails(pathSegments[1]);
      }
    }

    return MyRouteConfig.unknown();
  }

  static List<Page<dynamic>> getPages(MyRouteConfig currentConfiguration) {
    final List<Page<dynamic>> pages = [
      MaterialPage(
        key: ValueKey('HomeScreen'),
        name: 'Home',
        child: HomeScreen(),
      ),
    ];

    Key key = ValueKey(currentConfiguration.uri.path);
    String name = currentConfiguration.uri.path;
    Widget screen;

    if (currentConfiguration.isBrandList)
      screen = BrandListScreen();

    if (currentConfiguration.isCategoryList)
      screen = CategoryListScreen();

    if (currentConfiguration.isProductDetail)
      screen = ProductDetailScreen();

    if (currentConfiguration.isProductList)
      screen = ProductListScreen();

    if (currentConfiguration.isStockList)
      screen = StockListScreen();

    if (currentConfiguration.isStockDetailsOfProduct)
      screen = StoreDetailsScreen();

    if (currentConfiguration.isCustomerList)
      screen = CustomerListScreen();

    if (currentConfiguration.isCustomerDetails)
      screen = CustomerDetailsScreen();

    if (currentConfiguration.isOrderList)
      screen = OrderListScreen();

    if (currentConfiguration.isOrderDetails)
      screen = OrderDetailsScreen();

    if (currentConfiguration.isStaffList)
      screen = StaffListScreen();

    if (currentConfiguration.isStaffDetails)
      screen = StaffDetailsScreen();

    if (currentConfiguration.isStoreList)
      screen = StoreListScreen();

    if (currentConfiguration.isStoreDetails)
      screen = StoreDetailsScreen();

    if (currentConfiguration.isUnknown)
      screen = UnknownScreen();

    if (screen != null) {
      pages.add(MaterialPage(
          key: key,
          name: name,
          child: screen
      ));
    }

    return pages;
  }

  static bool compareConfigsUris(MyRouteConfig config, MyRouteConfig otherConfig, {
    int maxIndex
  }) {
    final otherUri = otherConfig.uri;
    if (config.uri.pathSegments.length != otherUri.pathSegments.length) {
      return false;
    }

    final max = maxIndex ?? config.uri.pathSegments.length - 1;
    for (var i = 0; i <= max; i++) {
      if (config.uri.pathSegments[i] != otherUri.pathSegments[i]) {
        return false;
      }
    }
    return true;
  }

  static bool comparePathSegments(List<String> segments, List<String> otherSegments) {
    if (segments.length != otherSegments.length) {
      return false;
    }
    for (var i = 0; i < segments.length; i++) {
      if (segments[i] != otherSegments[i]) {
        return false;
      }
    }
    return true;
  }

}