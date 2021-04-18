import 'package:equatable/equatable.dart';

class RouteConfig extends Equatable {
  final Uri uri;
  final String productId;

  RouteConfig._(this.uri, {
    this.productId,
  });

  bool get isHome => (this == RouteConfig.home());
  RouteConfig.home(): this._(Uri(path: '/'));

  bool get isProductDetail => productId != null;
  RouteConfig.productDetail(String productId) : this._(
    Uri(path: '/product/$productId'),
    productId: productId,
  );

  bool get isProductList => (this == RouteConfig.productList());
  RouteConfig.productList(): this._(Uri(path: '/products'));

  bool get isUnknown => (this == RouteConfig.unknown());
  RouteConfig.unknown(): this._(Uri(path: '/unknown'));

  @override
  List<Object> get props => [
    uri.path,
    productId,
  ];

}
