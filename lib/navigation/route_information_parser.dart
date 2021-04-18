import 'package:bike_store_admin_flutter/navigation/route_config.dart';
import 'package:flutter/material.dart';

class MyRouteInformationParser extends RouteInformationParser<RouteConfig> {
  @override
  Future<RouteConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    final pathSegments = uri.pathSegments;
    final pathSegmentsCount = pathSegments.length;

    print("Parser location: ${routeInformation.location}");

    if (pathSegmentsCount == 0) {
      return RouteConfig.home();
    }

    if (pathSegmentsCount == 1) {
      if (pathSegments[0] == RouteConfig.productList().uri.pathSegments[0]) {
        return RouteConfig.productList();
      }
      if (pathSegments[0] == RouteConfig.unknown().uri.pathSegments[0]) {
        return RouteConfig.unknown();
      }
    }

    if (pathSegmentsCount == 2) {
      if (pathSegments[0] == RouteConfig.productDetail('productId').uri.pathSegments[0]) {
        final id = pathSegments[1];
        return RouteConfig.productDetail(id);
      }
    }

    return RouteConfig.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(RouteConfig path) {
    RouteConfig routeConfig = _getRouteConfig(path);
    return RouteInformation(location: routeConfig.uri.path);
  }

  RouteConfig _getRouteConfig(RouteConfig path) {
    RouteConfig routeConfig = RouteConfig.unknown();
    if (path.isUnknown) {
      routeConfig = RouteConfig.unknown();
    }
    if (path.isProductDetail) {
      routeConfig = RouteConfig.productDetail(path.productId);
    }
    if (path.isProductList) {
      routeConfig = RouteConfig.productList();
    }
    if (path.isHome) {
      routeConfig = RouteConfig.home();
    }
    return routeConfig;
  }

}