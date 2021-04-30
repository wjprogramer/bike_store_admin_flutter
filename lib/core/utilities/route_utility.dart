import 'package:bike_store_admin_flutter/navigation/my_route_config.dart';
import 'package:flutter/material.dart';

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
      if (pathSegments[0] == MyRouteConfig.productList().uri.pathSegments[0]) {
        return MyRouteConfig.productList();
      }

      if (pathSegments[0] == MyRouteConfig.unknown().uri.pathSegments[0]) {
        return MyRouteConfig.unknown();
      }
    }

    if (pathSegmentsCount == 2) {
      if (pathSegments[0] == MyRouteConfig.productDetail(pathSegments[1]).uri.pathSegments[0]) {
        return MyRouteConfig.productDetail(pathSegments[1]);
      }
    }

    return MyRouteConfig.unknown();
  }

}