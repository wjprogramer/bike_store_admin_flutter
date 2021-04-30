import 'package:bike_store_admin_flutter/navigation/my_route_config.dart';
import 'package:bike_store_admin_flutter/presentations/screens/home/home_screen.dart';
import 'package:bike_store_admin_flutter/presentations/screens/product_details/product_details_screen.dart';
import 'package:bike_store_admin_flutter/presentations/screens/product_list/product_list_screen.dart';
import 'package:bike_store_admin_flutter/presentations/screens/unknown/unknown_screen.dart';
import 'package:flutter/material.dart';

class MyRouterDelegate extends RouterDelegate<MyRouteConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRouteConfig> {

  final GlobalKey<NavigatorState> _navigatorKey;

  MyRouteConfig _currentConfiguration;
  MyRouteConfig _previousConfiguration;

  MyRouterDelegate({
    MyRouteConfig currentState,
  }): _currentConfiguration = currentState,
        _navigatorKey = GlobalKey<NavigatorState>()
  {
    print("RouterDelegate initialized");
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  MyRouteConfig get currentConfiguration => _currentConfiguration;

  @override
  Widget build(BuildContext context) {
    bool onPopPage(Route<dynamic> route, result) {
      return route.didPop(result);
    }
    
    // TransitionDelegate transitionDelegate = NoAnimationTransitionDelegate();

    return Navigator(
      key: navigatorKey,
      pages: _buildPages(),
      onPopPage: onPopPage,
      // transitionDelegate: transitionDelegate,
    );
  }

  List<Page<dynamic>> _buildPages() {
    final List<Page<dynamic>> pages = [
      MaterialPage(
        key: ValueKey('HomeScreen'),
        name: 'Home',
        child: HomeScreen(),
      ),
    ];

    if (_currentConfiguration.isProductDetail)
      pages.add(MaterialPage(
        key: ValueKey('ProductDetailScreen'),
        name: 'ProductDetail',
        child: ProductDetailScreen(),
      ));

    if (_currentConfiguration.isProductList)
      pages.add(MaterialPage(
        key: ValueKey('ProductListScreen'),
        name: 'ProductList',
        child: ProductListScreen(),
      ));

    if (_currentConfiguration.isUnknown)
      pages.add(
          MaterialPage(
            key: ValueKey('UnknownScreen'),
            name: 'Unknown',
            child: UnknownScreen(),
          )
      );

    return pages;
  }

  @override
  Future<void> setNewRoutePath(MyRouteConfig newState) async {
    _currentConfiguration = newState;
    return;
  }

  void goProductList() {
    _currentConfiguration = MyRouteConfig.productList();
    notifyListeners();
  }

}