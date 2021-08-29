import 'package:bike_store_admin_flutter/presentations/layout/base_layout/base_layout.dart';
import 'package:flutter/material.dart';

class BaseNavBar extends StatefulWidget {
  final bool isMobile;

  BaseNavBar({
    required this.isMobile
  });

  @override
  _BaseNavBarState createState() => _BaseNavBarState();
}

class _BaseNavBarState extends State<BaseNavBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Row(
        children: [
          if (widget.isMobile)
            IconButton(
              onPressed: () {
                BaseLayout.of(context).toggleDrawer();
              },
              icon: Icon(Icons.menu),
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
