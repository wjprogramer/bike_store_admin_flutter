import 'package:bike_store_admin_flutter/navigation/route_config.dart';
import 'package:bike_store_admin_flutter/presentations/screens/home/home_screen.dart';
import 'package:bike_store_admin_flutter/presentations/screens/product_details/product_details_screen.dart';
import 'package:bike_store_admin_flutter/presentations/screens/product_list/product_list_screen.dart';
import 'package:bike_store_admin_flutter/presentations/screens/unknown/unknown_screen.dart';
import 'package:flutter/material.dart';

class MyRouterDelegate extends RouterDelegate<RouteConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteConfig> {
  final GlobalKey<NavigatorState> navigatorKey;

  RouteConfig currentState;
  RouteConfig previousState;

  MyRouterDelegate({
    this.currentState,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    print("RouterDelegate initialized");
  }

  RouteConfig get currentConfiguration => currentState;

  List<Page<dynamic>> buildPage() {
    print("Delegate currentState: $currentState");
    final List<Page<dynamic>> pages = [];
    pages.add(MaterialPage(
      key: ValueKey('HomeScreen'),
      name: 'Home',
      child: HomeScreen(),
    ));

    if (currentState.isProductDetail)
      pages.add(MaterialPage(
        key: ValueKey('ProductDetailScreen'),
        name: 'ProductDetail',
        child: ProductDetailScreen(),
      ));

    if (currentState.isProductList)
      pages.add(MaterialPage(
        key: ValueKey('ProductListScreen'),
        name: 'ProductList',
        child: ProductListScreen(),
      ));

    if (currentState.isUnknown)
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
  Widget build(BuildContext context) {

    bool onPopPage(Route<dynamic> route, result) {
      if (!route.didPop(result)) {
        return false;
      }

      if (currentState.uri.pathSegments[0] == RouteConfig.productDetail('').uri.pathSegments[0] &&
          currentState.productId != null
      ) {
        currentState = RouteConfig.productDetail(currentState.productId);
      } else if (currentState == RouteConfig.productList()) {
        currentState = previousState;
        previousState = null;
      } else {
        currentState = RouteConfig.unknown();
      }
      notifyListeners();
      return true;
    }
    
    // TransitionDelegate transitionDelegate = NoAnimationTransitionDelegate();

    return Navigator(
      key: navigatorKey,
      pages: buildPage(),
      onPopPage: onPopPage,
      // transitionDelegate: transitionDelegate,
    );
  }

  @override
  Future<void> setNewRoutePath(RouteConfig newState) async {
    currentState = newState;
    return;
  }

  void goProductList() {
    currentState = RouteConfig.productList();
    notifyListeners();
  }

  // void handleBookTapped(Book book) {
  //   currentState = RouteConfig.bookDetail(books.indexOf(book));
  //   notifyListeners();
  // }
  //
  // void handleUserTapped(void _) {
  //   previousState = currentState;
  //   currentState = RouteConfig.user();
  //   notifyListeners();
  // }

  // void _notifyListeners(void nothing) {
  //   notifyListeners();
  // }
}