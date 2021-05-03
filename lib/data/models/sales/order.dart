import 'package:bike_store_admin_flutter/data/models/base_model.dart';
import 'package:bike_store_admin_flutter/data/models/sales/staff.dart';

import 'customer.dart';
import 'order_item.dart';
import 'store.dart';

class Order implements BaseModel {

  String id;
  String orderStatus;
  String orderDate;
  String requiredDate;
  String shippedDate;
  String customerId;
  String storeId;
  String staffId;
  bool isDeleted;

  Customer customer;
  Store store;
  Staff staff;
  List<OrderItem> orderItems;

  Order({
    this.id,
    this.orderStatus,
    this.orderDate,
    this.requiredDate,
    this.shippedDate,
    this.customerId,
    this.storeId,
    this.staffId,
    this.isDeleted,
    this.customer,
    this.store,
    this.staff,
  });

  @override
  factory Order.fromJson(Map<String, dynamic> json) {
    final customer = json['customer'] is Map<String, dynamic>
        ? Customer.fromJson(json['customer']) : null;
    final store = json['store'] is Map<String, dynamic>
        ? Store.fromJson(json['store']) : null;
    final staff = json['staff'] is Map<String, dynamic>
        ? Staff.fromJson(json['staff']) : null;

    return Order(
      id: json['id']?.toString(),
      orderStatus: json['order_status'],
      orderDate: json['order_date'],
      requiredDate: json['required_date'],
      shippedDate: json['shipped_date'],
      customerId: json['customer_id'],
      storeId: json['store_id'],
      staffId: json['staff_id'],
      isDeleted: json['is_deleted'],
      customer: customer,
      store: store,
      staff: staff,

    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_status': orderStatus,
      'order_date': orderDate,
      'required_date': requiredDate,
      'shipped_date': shippedDate,
      'customer_id': customerId,
      'store_id': storeId,
      'staff_id': staffId,
      'is_deleted': isDeleted,
      'customer': customer?.toJson(),
      'store': store?.toJson(),
      'staff': staff?.toJson(),
    };
  }

}