import 'package:bike_store_admin_flutter/navigation/router_delegate.dart';
import 'package:bike_store_admin_flutter/presentations/view_models/router_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

mixin Routing<T extends StatefulWidget> on State<T> {

  RouterViewModel routerViewModel;

  void setupRoute(BuildContext context) {
    final delegate = Router.of(context).routerDelegate as MyRouterDelegate;
    routerViewModel = context.watch();
    routerViewModel.setRouterDelegate(delegate);
    print("Routing...");
  }

}