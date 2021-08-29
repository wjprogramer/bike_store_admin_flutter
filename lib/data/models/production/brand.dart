import 'package:bike_store_admin_flutter/data/models/base_model.dart';

class Brand implements BaseModel {

  String? id;
  String? name;
  bool? isDeleted;

  Brand({
    this.id,
    this.name,
    this.isDeleted,
  });

  @override
  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id']?.toString(),
      name: json['name'],
      isDeleted: json['is_deleted'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'is_deleted': isDeleted,
    };
  }

}