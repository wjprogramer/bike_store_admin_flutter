import 'package:bike_store_admin_flutter/core/utilities/route_utility.dart';
import 'package:bike_store_admin_flutter/core/utils/mixins/base_screen_state.dart';
import 'package:bike_store_admin_flutter/navigation/my_route_information_parser.dart';
import 'package:bike_store_admin_flutter/navigation/my_router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:universal_html/html.dart" as html;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'base_nav_bar.dart';
import 'base_side_bar.dart';

class BaseLayout extends StatefulWidget {
  static MyRouterDelegate? routerDelegate;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  BaseLayoutState createState() => BaseLayoutState();

  static BaseLayoutState of(
    BuildContext context, {
    bool rootNavigator = false,
  }) {
    BaseLayoutState? state;
    if (context is StatefulElement && context.state is BaseLayoutState) {
      state = context.state as BaseLayoutState;
    }
    if (rootNavigator) {
      state = context.findRootAncestorStateOfType<BaseLayoutState>() ?? state;
    } else {
      state = state ?? context.findAncestorStateOfType<BaseLayoutState>();
    }
    return state!;
  }
}

class BaseLayoutState extends State<BaseLayout> with BaseScreenState {
  PlatformRouteInformationProvider? _routeInformationProvider;

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
    BaseLayout.routerDelegate = MyRouterDelegate(currentState: routeConfig);
  }

  @override
  void dispose() {
    _routeInformationProvider!.dispose();
    super.dispose();
  }

  void toggleDrawer() {
    if (!widget.scaffoldKey.currentState!.isDrawerOpen) {
      widget.scaffoldKey.currentState!.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        key: widget.scaffoldKey,
        drawer: isMobile ? BaseSideBar(
          myRouterDelegate: BaseLayout.routerDelegate,
        ) : null,
        body: Row(
          children: [
            if (!isMobile)
              BaseSideBar(
                myRouterDelegate: BaseLayout.routerDelegate,
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
                      routerDelegate: BaseLayout.routerDelegate!,
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
