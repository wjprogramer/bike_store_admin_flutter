import 'package:bike_store_admin_flutter/data/models/base_model.dart';

class Customer implements BaseModel {

  String id;
  String firstName;
  String lastName;
  String email;
  String street;
  String city;
  String state;
  String zipCode;
  bool isDeleted;

  Customer({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.street,
    this.city,
    this.state,
    this.zipCode,
    this.isDeleted,
  });

  @override
  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id']?.toString(),
      firstName: json['first_name'],
      lastName: json['last_name'],
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
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'street': street,
      'city': city,
      'state': state,
      'zip_code': zipCode,
      'is_deleted': isDeleted,
    };
  }

}