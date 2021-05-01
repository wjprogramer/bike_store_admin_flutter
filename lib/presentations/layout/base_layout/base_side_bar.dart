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
      height: double.infinity,
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
      child: SingleChildScrollView(
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title('Bike Store'),
              _subTitle('Production'),
              _link(
                text: 'Brands',
                onPressed: () {
                  _myRouterDelegate.goBrandList();
                },
              ),
              _link(
                text: 'Categories',
                onPressed: () {
                  _myRouterDelegate.goCategoryList();
                },
              ),
              _link(
                text: 'Products',
                onPressed: () {
                  _myRouterDelegate.goProductList();
                },
              ),
              _link(
                text: 'Stocks',
                onPressed: () {
                  _myRouterDelegate.goStockList();
                },
              ),
              _separator(),
              _subTitle('Sales'),
              _link(
                text: 'Customers',
                onPressed: () {
                  _myRouterDelegate.goCustomerList();
                },
              ),
              _link(
                text: 'Orders',
                onPressed: () {
                  _myRouterDelegate.goOrderList();
                },
              ),
              _link(
                text: 'Staffs',
                onPressed: () {
                  _myRouterDelegate.goStaffList();
                },
              ),
              _link(
                text: 'Stores',
                onPressed: () {
                  _myRouterDelegate.goStoreList();
                },
              ),
              _separator(),
              _link(
                text: 'About',
                onPressed: () {
                  _myRouterDelegate.goProductList();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _subTitle(String subTitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        subTitle,
        style: TextStyle(
          fontSize: 24,
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

  Widget _separator() {
    return Container(
      height: 1,
      margin: const EdgeInsets.only(top: 8, bottom: 24),
      width: double.infinity,
      color: Colors.black.withOpacity(0.5),
    );
  }

}
