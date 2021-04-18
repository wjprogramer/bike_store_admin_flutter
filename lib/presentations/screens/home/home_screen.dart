import 'package:bike_store_admin_flutter/core/utils/mixins/routing.dart';
import 'package:bike_store_admin_flutter/navigation/router_delegate.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with Routing {
  @override
  Widget build(BuildContext context) {
    setupRoute(context);

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
