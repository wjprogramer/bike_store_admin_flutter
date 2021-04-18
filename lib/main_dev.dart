import 'package:bike_store_admin_flutter/app/app.dart';
import 'package:bike_store_admin_flutter/app/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {

  setPathUrlStrategy();

  runApp(
    MultiProvider(
      providers: getProviders(),
      child: App(),
    )
  );
}
