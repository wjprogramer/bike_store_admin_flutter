import 'package:bike_store_admin_flutter/data/models/base_model.dart';

class OrderItem implements BaseModel {

  String? id;
  String? orderId;
  String? quantity;
  String? listPrice;
  String? discount;
  String? productId;
  bool? isDeleted;

  OrderItem({
    this.id,
    this.orderId,
    this.quantity,
    this.listPrice,
    this.discount,
    this.productId,
    this.isDeleted,
  });

  @override
  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id']?.toString(),
      orderId: json['order_id'],
      quantity: json['quantity'],
      listPrice: json['list_price'],
      discount: json['discount'],
      productId: json['product_id'],
      isDeleted: json['is_deleted'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'quantity': quantity,
      'list_price': listPrice,
      'discount': discount,
      'product_id': productId,
      'is_deleted': isDeleted,
    };
  }

}