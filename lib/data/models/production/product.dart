import 'package:bike_store_admin_flutter/data/models/base_model.dart';

class Product implements BaseModel {

  String? id;
  String? name;
  int? modelYear;
  double? listPrice;
  int? brandId;
  int? categoryId;
  List<String>? imagesUrls;
  bool? visible;
  bool? enable;
  bool? isDeleted;

  Product({
    this.id,
    this.name,
    this.modelYear,
    this.listPrice,
    this.brandId,
    this.categoryId,
    this.imagesUrls,
    this.visible,
    this.enable,
    this.isDeleted,
  });

  @override
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id']?.toString(),
      name: json['name'],
      modelYear: json['model_year'],
      listPrice: double.tryParse(json['list_price']),
      brandId: json['brand_id'],
      categoryId: json['category_id'],
      imagesUrls: json['images_urls'] ?? [],
      visible: json['visible'],
      enable: json['enable'],
      isDeleted: json['is_deleted'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'model_year': modelYear,
      'list_price': listPrice,
      'brand_id': brandId,
      'category_id': categoryId,
      'images_urls': imagesUrls,
      'visible': visible,
      'enable': enable,
      'is_deleted': isDeleted,
    };
  }

}