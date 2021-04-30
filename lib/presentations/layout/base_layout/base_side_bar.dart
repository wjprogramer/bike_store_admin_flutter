import 'package:bike_store_admin_flutter/navigation/my_router_delegate.dart';
import 'package:flutter/material.dart';

class BaseSideBar extends StatefulWidget {
  final MyRouterDelegate myRouterDelegate;

  BaseSideBar({
    @required this.myRouterDelegate
  });

  @override
  _BaseSideBarState createState() => _BaseSideBarState();
}

class _BaseSideBarState extends State<BaseSideBar> {
  MyRouterDelegate _myRouterDelegate;

  @override
  void initState() {
    super.initState();
    _myRouterDelegate = widget.myRouterDelegate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          _link(
            text: 'Home',
            onPressed: () {
              _myRouterDelegate.goProductList();
            },
          ),
          _link(
            text: 'About',
            onPressed: () {
              _myRouterDelegate.goProductList();
            },
          ),
          _link(
            text: 'Contact',
            onPressed: () {
              _myRouterDelegate.goProductList();
            },
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        'SideBar',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _link({
    String text = '',
    Function onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 8),
      child: GestureDetector(
          onTap: onPressed ?? () {},
          child: Text(text, style: TextStyle(fontSize: 20),)
      ),
    );
  }

}
