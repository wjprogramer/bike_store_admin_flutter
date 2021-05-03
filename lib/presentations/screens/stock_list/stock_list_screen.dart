import 'package:bike_store_admin_flutter/core/utils/mixins/base_screen_state.dart';
import 'package:flutter/material.dart';

class StockListScreen extends StatefulWidget {
  @override
  _StockListScreenState createState() => _StockListScreenState();
}

class _StockListScreenState extends State<StockListScreen> with BaseScreenState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Stock List'),
      ),
    );
  }
}
