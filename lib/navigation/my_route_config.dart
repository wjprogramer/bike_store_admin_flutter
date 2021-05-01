import 'package:bike_store_admin_flutter/core/utilities/route_utility.dart';
import 'package:equatable/equatable.dart';

class MyRouteConfig extends Equatable {
  final Uri uri;

  final String id;

  MyRouteConfig._(this.uri, {
    this.id,
  });

  bool get isHome => RouteUtility.compareConfigsUris(this, MyRouteConfig.home());
  MyRouteConfig.home(): this._(Uri(path: '/'));

  bool get isBrandList => RouteUtility.compareConfigsUris(this, MyRouteConfig.brandList());
  MyRouteConfig.brandList(): this._(Uri(path: '/brands'));

  bool get isCategoryList => RouteUtility.compareConfigsUris(this, MyRouteConfig.categoryList());
  MyRouteConfig.categoryList(): this._(Uri(path: '/categories'));

  bool get isProductList => RouteUtility.compareConfigsUris(this, MyRouteConfig.productList());
  MyRouteConfig.productList(): this._(Uri(path: '/products'));

  bool get isProductDetail => RouteUtility.compareConfigsUris(this, MyRouteConfig.productDetails(id));
  MyRouteConfig.productDetails(String productId) : this._(
    Uri(path: '/product/$productId'),
    id: productId,
  );

  bool get isStockList => RouteUtility.compareConfigsUris(this, MyRouteConfig.stockList());
  MyRouteConfig.stockList(): this._(Uri(path: '/stocks'));

  bool get isStockDetailsOfProduct => RouteUtility.compareConfigsUris(this, MyRouteConfig.stockDetailsOfProduct(id));
  MyRouteConfig.stockDetailsOfProduct(String productId): this._(
    Uri(path: '/product/stock/$productId'),
    id: productId,
  );

  bool get isCustomerList => RouteUtility.compareConfigsUris(this, MyRouteConfig.customerList());
  MyRouteConfig.customerList(): this._(Uri(path: '/customers'));

  bool get isCustomerDetails => RouteUtility.compareConfigsUris(this, MyRouteConfig.customerDetails(id));
  MyRouteConfig.customerDetails(String customerId): this._(
    Uri(path: '/customer/$customerId'),
    id: customerId
  );

  bool get isOrderList => RouteUtility.compareConfigsUris(this, MyRouteConfig.orderList());
  MyRouteConfig.orderList(): this._(Uri(path: '/orders'));

  bool get isOrderDetails => RouteUtility.compareConfigsUris(this, MyRouteConfig.orderDetails(id));
  MyRouteConfig.orderDetails(String orderId): this._(
    Uri(path: '/order/$orderId'),
    id: orderId,
  );

  bool get isStaffList => RouteUtility.compareConfigsUris(this, MyRouteConfig.staffList());
  MyRouteConfig.staffList(): this._(Uri(path: '/staffs'));

  bool get isStaffDetails => RouteUtility.compareConfigsUris(this, MyRouteConfig.staffDetails(id));
  MyRouteConfig.staffDetails(String staffId): this._(
    Uri(path: '/staff/$staffId'),
    id: staffId
  );

  bool get isStoreList => RouteUtility.compareConfigsUris(this, MyRouteConfig.storeList());
  MyRouteConfig.storeList(): this._(Uri(path: '/stores'));

  bool get isStoreDetails => RouteUtility.compareConfigsUris(this, MyRouteConfig.storeDetails(id));
  MyRouteConfig.storeDetails(String storeId): this._(
    Uri(path: '/store/$storeId'),
    id: storeId,
  );

  bool get isUnknown => RouteUtility.compareConfigsUris(this, MyRouteConfig.unknown());
  MyRouteConfig.unknown(): this._(Uri(path: '/unknown'));

  @override
  List<Object> get props => [
    uri.path,
    id,
  ];
  
}
