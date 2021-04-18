import 'package:bike_store_admin_flutter/presentations/layout/base_layout/base_layout.dart';
import 'package:flutter/material.dart';
import "package:universal_html/html.dart" as html;
import 'package:flutter/foundation.dart' show kIsWeb;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var initialRoute = "/";
    // if (kIsWeb) {
    //   initialRoute = html.window.location.href.substring("${html.window.location.origin}/#".length);
    // }

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      onGenerateRoute: (_) {
        return PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 0),
          reverseTransitionDuration: const Duration(milliseconds: 0),
          pageBuilder: (_, __, ___) => BaseLayout(
            // initialRoute: initialRoute,
          )
        );
      },
    );
  }
}