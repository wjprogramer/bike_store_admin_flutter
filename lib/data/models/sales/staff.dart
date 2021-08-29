import 'package:bike_store_admin_flutter/data/models/base_model.dart';
import 'package:bike_store_admin_flutter/data/models/sales/store.dart';

class Staff implements BaseModel {

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  int? active;
  int? storeId;
  int? managerId;
  Store? store;

  Staff({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.active,
    this.storeId,
    this.managerId,
    this.store,
  });

  @override
  factory Staff.fromJson(Map<String, dynamic> json) {
    final store = json['store'] is Map<String, dynamic>
        ? Store.fromJson(json['store']) : null;

    return Staff(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      active: json['active'],
      storeId: json['store_id'],
      managerId: json['manager_id'],
      store: store,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'active': active,
      'store_id': storeId,
      'manager_id': managerId,
      'store': store?.toJson(),
    };
  }

}