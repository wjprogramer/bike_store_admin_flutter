import 'package:bike_store_admin_flutter/data/models/base_model.dart';

class Store implements BaseModel {

  String id;
  String storeName;
  String phone;
  String email;
  String street;
  String city;
  String state;
  String zipCode;
  bool isDeleted;

  Store({
    this.id,
    this.storeName,
    this.phone,
    this.email,
    this.street,
    this.city,
    this.state,
    this.zipCode,
    this.isDeleted,
  });

  @override
  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id']?.toString(),
      storeName: json['name'],
      phone: json['phone'],
      email: json['email'],
      street: json['street'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zip_code'],
      isDeleted: json['is_deleted'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': storeName,
      'phone': phone,
      'email': email,
      'street': street,
      'city': city,
      'state': state,
      'zip_code': zipCode,
      'is_deleted': isDeleted,
    };
  }

}