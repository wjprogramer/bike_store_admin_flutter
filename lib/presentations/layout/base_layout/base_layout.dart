import 'package:bike_store_admin_flutter/core/utilities/route_utility.dart';
import 'package:bike_store_admin_flutter/navigation/my_route_information_parser.dart';
import 'package:bike_store_admin_flutter/navigation/my_router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import "package:universal_html/html.dart" as html;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'base_nav_bar.dart';
import 'base_side_bar.dart';

class BaseLayout extends StatefulWidget {
  @override
  _BaseLayoutState createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  PlatformRouteInformationProvider _routeInformationProvider;

  MyRouterDelegate _routerDelegate;
  MyRouteInformationParser _routeInformationParser = MyRouteInformationParser();

  @override
  void initState() {
    super.initState();
    final routeInformation = RouteInformation(
      location: _getInitialRoute(),
    );

    _routeInformationProvider = PlatformRouteInformationProvider(
        initialRouteInformation: routeInformation
    );

    final routeConfig = RouteUtility.getRouteConfig(routeInformation);
    _routerDelegate = MyRouterDelegate(currentState: routeConfig);
  }

  String _getInitialRoute() {
    var initialRoute = "/";
    if (kIsWeb) {
      final origin = html.window.location.origin;
      final href = html.window.location.href;
      initialRoute = href.substring(origin.length);
    }
    return initialRoute;
  }

  @override
  void dispose() {
    _routeInformationProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        body: Row(
          children: [
            BaseSideBar(
              myRouterDelegate: _routerDelegate,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  BaseNavBar(),
                  Expanded(
                    child: Router(
                      routerDelegate: _routerDelegate,
                      routeInformationParser: _routeInformationParser,
                      routeInformationProvider: _routeInformationProvider,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
