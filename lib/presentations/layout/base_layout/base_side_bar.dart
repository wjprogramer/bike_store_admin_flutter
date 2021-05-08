import 'package:bike_store_admin_flutter/navigation/my_router_delegate.dart';
import 'package:bike_store_admin_flutter/presentations/components/parent_nav_item.dart';
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
    return Drawer(
      elevation: 0.0,
      child: Container(
        height: double.infinity,
        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                child: _title('Bike Store'),
              ),
              SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _subTitle('Production'),
                      _link(
                        text: 'Brands',
                        icon: Icons.local_offer_outlined,
                        onPressed: () {
                          _myRouterDelegate.goBrandList();
                        },
                      ),
                      _link(
                        text: 'Categories',
                        icon: Icons.reorder_rounded,
                        onPressed: () {
                          _myRouterDelegate.goCategoryList();
                        },
                      ),
                      _link(
                        text: 'Products',
                        icon: Icons.shopping_cart_outlined,
                        onPressed: () {
                          _myRouterDelegate.goProductList();
                        },
                      ),
                      _link(
                        text: 'Stocks',
                        icon: Icons.compare_arrows_outlined,
                        onPressed: () {
                          _myRouterDelegate.goStockList();
                        },
                      ),
                      _separator(),
                      _subTitle('Sales'),
                      _link(
                        text: 'Customers',
                        icon: Icons.people_outline,
                        onPressed: () {
                          _myRouterDelegate.goCustomerList();
                        },
                      ),
                      _link(
                        text: 'Orders',
                        icon: Icons.list_outlined,
                        onPressed: () {
                          _myRouterDelegate.goOrderList();
                        },
                      ),
                      _link(
                        text: 'Staffs',
                        icon: Icons.admin_panel_settings_outlined,
                        onPressed: () {
                          _myRouterDelegate.goStaffList();
                        },
                      ),
                      _link(
                        text: 'Stores',
                        icon: Icons.store_outlined,
                        onPressed: () {
                          _myRouterDelegate.goStoreList();
                        },
                      ),
                      _separator(),
                      _subTitle('Developer'),
                      ParentNavItem(
                          text: 'Interface',
                          icon: Icons.build,
                          children: [
                            _link(
                              text: 'Colors',
                              onPressed: () {
                                _myRouterDelegate.goStoreList();
                              },
                            ),
                            _link(
                              text: 'Font',
                              onPressed: () {
                                _myRouterDelegate.goStoreList();
                              },
                            ),
                          ]
                      ),
                      _separator(),
                      _link(
                        text: 'About',
                        icon: Icons.mail_outline,
                        onPressed: () {
                          _myRouterDelegate.goProductList();
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(String title) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16, right: 16),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
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
    IconData icon,
    Function onPressed,
  }) {
    return ListTile(
      leading: icon != null ? Icon(
        icon,
        color: Colors.white54,
        size: 16,
      ) : null,
      horizontalTitleGap: 0.0,
      onTap: onPressed ?? () {},
      title: Text(text, style: TextStyle(fontSize: 20),),
    );
  }

  Widget _separator() {
    return Container(
      height: 1,
      margin: const EdgeInsets.only(top: 24, bottom: 24),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: Divider.createBorderSide(context),
        ),
      ),
    );
  }

}
