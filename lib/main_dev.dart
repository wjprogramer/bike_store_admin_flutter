import 'package:bike_store_admin_flutter/app/app.dart';
import 'package:bike_store_admin_flutter/app/app_providers.dart';
import 'package:bike_store_admin_flutter/app/dependency_injection.dart' as di;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  await di.init();

  setPathUrlStrategy();

  runApp(
    // MultiProvider(
    //   providers: getProviders(),
      App(),
    // )
  );
}
