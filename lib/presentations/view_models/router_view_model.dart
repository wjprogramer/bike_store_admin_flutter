import 'package:bike_store_admin_flutter/navigation/router_delegate.dart';
import 'package:flutter/material.dart';

class RouterViewModel extends ChangeNotifier {
  MyRouterDelegate _routerDelegate;

  MyRouterDelegate get routerDelegate  => _routerDelegate;

  void setRouterDelegate(MyRouterDelegate delegate) {
    _routerDelegate = delegate;
  }
}