import 'package:bike_store_admin_flutter/navigation/my_route_config.dart';
import 'package:flutter/material.dart';

typedef PageBuilder = Page Function(RouteItem routeConfig);
typedef OnRouteInformationParse = Future<MyRouteConfig> Function(RouteInformation routeInformation);

class RouteItem {
  // parse
  OnRouteInformationParse? onRouteInformationParse;
  int? pathSegmentsCount;

  // delegate
  Widget child;
  Page? page;
  PageBuilder? pageBuilder;
  Key? key;
  String? keyValue;
  String? name;

  RouteItem({
    // parse
    this.onRouteInformationParse,
    this.pathSegmentsCount,
    // delegate
    required this.child,
    this.page,
    this.pageBuilder,
    this.key,
    this.keyValue,
    this.name,
  }) {
    assert(key != null || keyValue != null || name != null);

    if (key == null) {
      key = ValueKey(keyValue ?? name);
    }

    if (pageBuilder != null) {
      page = pageBuilder!(this);
    } else if (pageBuilder == null && page == null) {
      page = MaterialPage(
        child: child,
        name: name,
        key: key as LocalKey?,
      );
    }
  }
}

void test() {

}