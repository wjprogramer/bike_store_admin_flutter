import 'package:bike_store_admin_flutter/navigation/route_config.dart';
import 'package:bike_store_admin_flutter/navigation/route_information_parser.dart';
import 'package:bike_store_admin_flutter/navigation/router_delegate.dart';
import 'package:bike_store_admin_flutter/presentations/view_models/router_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import "package:universal_html/html.dart" as html;
import 'package:flutter/foundation.dart' show kIsWeb;

class BaseLayout extends StatefulWidget {
  final String initialRoute;

  BaseLayout({
    this.initialRoute = '/',
  });

  @override
  _BaseLayoutState createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  RouterViewModel _routerViewModel;
  PlatformRouteInformationProvider _routeInformationProvider;

  MyRouterDelegate _routerDelegate;
  MyRouteInformationParser _routeInformationParser = MyRouteInformationParser();

  @override
  void initState() {
    super.initState();

    var initialRoute = "/";
    if (kIsWeb) {
      final origin = html.window.location.origin;
      final href = html.window.location.href;
      initialRoute = href.substring(origin.length);
    }

    _routeInformationProvider = PlatformRouteInformationProvider(
        initialRouteInformation: RouteInformation(
          location: initialRoute,
        )
    );

    // FIXME: improve
    var currentState = RouteConfig.home();
    if (initialRoute == '/products') {
      currentState = RouteConfig.productList();
    }
    _routerDelegate = MyRouterDelegate(
      currentState: currentState,
    );
  }

  @override
  void didUpdateWidget(BaseLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateRouting(oldWidget);
  }

  _updateRouting(BaseLayout oldWidget) {

  }

  @override
  void dispose() {
    _routeInformationProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _routerViewModel = context.watch();

    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        body: Row(
          children: [
            Container(
              width: 100,
              height: double.infinity,
              color: Colors.blue[100],
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      _routerViewModel.routerDelegate?.goProductList();
                    },
                    child: Text("Hello World"),
                  ),
                  Text("123"),
                  Text("123"),
                  Text("123"),
                ],
              ),
            ),
            Expanded(
              child: Builder(
                builder: (ctx) {
                  return Router(
                    routerDelegate: _routerDelegate,
                    routeInformationParser: _routeInformationParser,
                    routeInformationProvider: _routeInformationProvider,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
