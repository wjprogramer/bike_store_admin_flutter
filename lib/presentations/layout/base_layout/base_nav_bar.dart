import 'package:flutter/material.dart';

class BaseNavBar extends StatefulWidget {
  @override
  _BaseNavBarState createState() => _BaseNavBarState();
}

class _BaseNavBarState extends State<BaseNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: Colors.blue[100],
      child: Row(
        children: [
          Icon(
            Icons.menu,
          ),
          Expanded(child: SizedBox()),
          Icon(
            Icons.logout,
          ),
        ],
      ),
    );
  }
}
