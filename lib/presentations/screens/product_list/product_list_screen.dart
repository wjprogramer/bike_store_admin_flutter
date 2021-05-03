import 'package:bike_store_admin_flutter/core/utils/mixins/base_screen_state.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> with BaseScreenState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Product List'),
      ),
    );
  }
}
