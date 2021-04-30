import 'package:bike_store_admin_flutter/navigation/my_router_delegate.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          (Router.of(context).routerDelegate as MyRouterDelegate)
              .goProductList();
        },
        child: Text('Product List')
      ),
    );
  }
}
