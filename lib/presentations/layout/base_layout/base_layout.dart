import 'package:bike_store_admin_flutter/core/utilities/route_utility.dart';
import 'package:bike_store_admin_flutter/core/utils/mixins/base_screen_state.dart';
import 'package:bike_store_admin_flutter/navigation/my_route_information_parser.dart';
import 'package:bike_store_admin_flutter/navigation/my_router_delegate.dart';
import 'package:bike_store_admin_flutter/presentations/view_models/base_layout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:universal_html/html.dart" as html;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'base_nav_bar.dart';
import 'base_side_bar.dart';

class BaseLayout extends StatefulWidget {
  @override
  _BaseLayoutState createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> with BaseScreenState {
  BaseLayoutViewModel _baseLayoutViewModel;
  PlatformRouteInformationProvider _routeInformationProvider;

  MyRouterDelegate _routerDelegate;
  MyRouteInformationParser _routeInformationParser = MyRouteInformationParser();

  @override
  void initState() {
    super.initState();
    final routeInformation = RouteInformation(
      location: RouteUtility.getInitialRoute(),
    );

    _routeInformationProvider = PlatformRouteInformationProvider(
        initialRouteInformation: routeInformation
    );

    final routeConfig = RouteUtility.getRouteConfig(routeInformation);
    _routerDelegate = MyRouterDelegate(currentState: routeConfig);
  }

  @override
  void dispose() {
    _routeInformationProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _baseLayoutViewModel = context.watch<BaseLayoutViewModel>();

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        key: _baseLayoutViewModel.scaffoldKey,
        drawer: isMobile ? BaseSideBar(
          myRouterDelegate: _routerDelegate,
        ) : null,
        body: Row(
          children: [
            if (!isMobile)
              BaseSideBar(
                myRouterDelegate: _routerDelegate,
              ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BaseNavBar(
                    isMobile: isMobile,
                  ),
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
