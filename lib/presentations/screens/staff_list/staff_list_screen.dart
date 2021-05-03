import 'package:bike_store_admin_flutter/core/utils/mixins/base_screen_state.dart';
import 'package:flutter/material.dart';

class StaffListScreen extends StatefulWidget {
  @override
  _StaffListScreenState createState() => _StaffListScreenState();
}

class _StaffListScreenState extends State<StaffListScreen> with BaseScreenState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Staff List'),
      ),
    );
  }
}
