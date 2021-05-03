import 'package:bike_store_admin_flutter/core/utils/mixins/base_screen_state.dart';
import 'package:flutter/material.dart';

class CustomerDetailsScreen extends StatefulWidget {
  @override
  _CustomerDetailsScreenState createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> with BaseScreenState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Customer Details'),
      ),
    );
  }
}
