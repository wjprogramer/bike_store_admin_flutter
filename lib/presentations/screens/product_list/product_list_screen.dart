import 'package:bike_store_admin_flutter/navigation/router_delegate.dart';
import 'package:bike_store_admin_flutter/presentations/view_models/router_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  RouterViewModel _routerViewModel;

  @override
  Widget build(BuildContext context) {
    final delegate = Router.of(context).routerDelegate as MyRouterDelegate;
    _routerViewModel = context.watch();
    _routerViewModel.setRouterDelegate(delegate);

    return Scaffold(
      body: Center(
        child: Text('Product List'),
      ),
    );
  }
}
