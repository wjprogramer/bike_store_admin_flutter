import 'package:bike_store_admin_flutter/core/utilities/route_utility.dart';
import 'package:bike_store_admin_flutter/presentations/layout/base_layout/base_layout.dart';
import 'package:bike_store_admin_flutter/themes/dark/dark_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MaterialApp app;

    app = MaterialApp(
      title: 'Bike Store',
      debugShowCheckedModeBanner: false,
      theme: getDarkTheme(context),
      onGenerateInitialRoutes: (initialRoute) => [
        app.onGenerateRoute(RouteSettings(name: initialRoute))
      ],
      onGenerateRoute: (_) {
        return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 0),
            reverseTransitionDuration: const Duration(milliseconds: 0),
            pageBuilder: (_, __, ___) {
              return BaseLayout();
            }
        );
      },
    );

    return app;
  }
}