import 'package:bike_store_admin_flutter/core/utils/mixins/base_screen_state.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatefulWidget {
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> with BaseScreenState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Order Details'),
      ),
    );
  }
}
