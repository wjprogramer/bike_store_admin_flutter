import 'package:bike_store_admin_flutter/navigation/router_delegate.dart';
import 'package:bike_store_admin_flutter/presentations/view_models/router_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RouterViewModel _routerViewModel;

  @override
  Widget build(BuildContext context) {
    final delegate = Router.of(context).routerDelegate as MyRouterDelegate;
    _routerViewModel = context.watch();
    _routerViewModel.setRouterDelegate(delegate);

    return Container(
      color: Colors.green[100],
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          (Router.of(context).routerDelegate as MyRouterDelegate)
              .goProductList();
        },
        child: Text('Home')
      ),
    );
  }
}
