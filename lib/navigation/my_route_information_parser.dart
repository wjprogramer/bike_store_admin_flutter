import 'package:bike_store_admin_flutter/core/utilities/route_utility.dart';
import 'package:bike_store_admin_flutter/navigation/my_route_config.dart';
import 'package:flutter/material.dart';

class MyRouteInformationParser extends RouteInformationParser<MyRouteConfig> {

  @override
  Future<MyRouteConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    return RouteUtility.getRouteConfig(routeInformation);
  }

  @override
  RouteInformation restoreRouteInformation(MyRouteConfig routeConfig) {
    return RouteInformation(location: routeConfig.uri.path);
  }

}