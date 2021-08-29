import 'package:bike_store_admin_flutter/data/models/base_model.dart';
import 'package:bike_store_admin_flutter/data/models/sales/store.dart';

import 'product.dart';

class Stock implements BaseModel {

  String? id;
  int? quantity;
  int? storeId;
  int? productId;
  bool? isDeleted;
  Product? product;
  Store? store;

  Stock({
    this.id,
    this.quantity,
    this.storeId,
    this.productId,
    this.isDeleted,
    this.product,
    this.store,
  });

  @override
  factory Stock.fromJson(Map<String, dynamic> json) {
    final product = json['product'] is Map<String, dynamic>
        ? Product.fromJson(json['product']) : null;
    final store = json['store'] is Map<String, dynamic>
        ? Store.fromJson(json['store']) : null;

    return Stock(
      id: json['id']?.toString(),
      quantity: json['quantity'],
      storeId: json['store_id'],
      productId: json['product_id'],
      isDeleted: json['is_deleted'],
      product: product,
      store: store,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
      'store_id': storeId,
      'product_id': productId,
      'is_deleted': isDeleted,
      'product': product!.toJson(),
      'store': store!.toJson(),
    };
  }

}