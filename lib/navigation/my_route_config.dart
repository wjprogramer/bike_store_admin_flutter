import 'package:equatable/equatable.dart';

class MyRouteConfig extends Equatable {
  final Uri uri;
  final String productId;

  MyRouteConfig._(this.uri, {
    this.productId,
  });

  bool get isHome => (this == MyRouteConfig.home());
  MyRouteConfig.home(): this._(Uri(path: '/'));

  bool get isProductDetail => productId != null;
  MyRouteConfig.productDetail(String productId) : this._(
    Uri(path: '/product/$productId'),
    productId: productId,
  );

  bool get isProductList => (this == MyRouteConfig.productList());
  MyRouteConfig.productList(): this._(Uri(path: '/products'));

  bool get isUnknown => (this == MyRouteConfig.unknown());
  MyRouteConfig.unknown(): this._(Uri(path: '/unknown'));

  @override
  List<Object> get props => [
    uri.path,
    productId,
  ];

}
