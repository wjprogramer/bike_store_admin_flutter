import 'package:bike_store_admin_flutter/core/utils/mixins/base_screen_state.dart';
import 'package:flutter/material.dart';

class CategoryListScreen extends StatefulWidget {
  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> with BaseScreenState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Category List'),
      ),
    );
  }
}
