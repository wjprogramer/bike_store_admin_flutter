import 'package:bike_store_admin_flutter/core/utilities/route_utility.dart';
import 'package:bike_store_admin_flutter/navigation/my_route_config.dart';
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
      pages: RouteUtility.getPages(_currentConfiguration),
      onPopPage: onPopPage,
      // transitionDelegate: transitionDelegate,
    );
  }

  @override
  Future<void> setNewRoutePath(MyRouteConfig newState) async {
    _currentConfiguration = newState;
    return;
  }

  void _setCurrentConfiguration(MyRouteConfig myRouteConfig) {
    _currentConfiguration = myRouteConfig;
    notifyListeners();
  }

  void goBrandList() => _setCurrentConfiguration(MyRouteConfig.brandList());
  void goCategoryList() => _setCurrentConfiguration(MyRouteConfig.categoryList());
  void goProductList() => _setCurrentConfiguration(MyRouteConfig.productList());
  void goProductDetails(String productId) => _setCurrentConfiguration(MyRouteConfig.productDetails(productId));
  void goStockList() => _setCurrentConfiguration(MyRouteConfig.stockList());
  void goStockOfProduct(String productId) => _setCurrentConfiguration(MyRouteConfig.stockDetailsOfProduct(productId));
  void goCustomerList() => _setCurrentConfiguration(MyRouteConfig.customerList());
  void goCustomerDetails(String customerId) => _setCurrentConfiguration(MyRouteConfig.customerDetails(customerId));
  void goOrderList() => _setCurrentConfiguration(MyRouteConfig.orderList());
  void goOrderDetails(String orderId) => _setCurrentConfiguration(MyRouteConfig.orderDetails(orderId));
  void goStaffList() => _setCurrentConfiguration(MyRouteConfig.staffList());
  void goStoreList() => _setCurrentConfiguration(MyRouteConfig.storeList());
  void goStoreDetails(String storeId) => _setCurrentConfiguration(MyRouteConfig.storeDetails(storeId));

}