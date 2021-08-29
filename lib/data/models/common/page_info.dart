import 'package:bike_store_admin_flutter/data/models/base_model.dart';

class PageInfo implements BaseModel {

  int? size;
  int? page;
  int? dataCount;
  int? totalPages;
  int? totalDataCount;

  PageInfo({
    this.size,
    this.page,
    this.dataCount,
    this.totalPages,
    this.totalDataCount,
  });

  bool get isLast => page == totalPages! - 1;
  bool get isFirst => page == 0;

  PageInfo.withInitialValue(): this(
    size: 10, page: 0, dataCount: 0, totalPages: 0, totalDataCount: 0,
  );

  @override
  factory PageInfo.fromJson(Map<String, dynamic> json) {
    return PageInfo(
      size: json['size'],
      page: json['page'],
      dataCount: json['data_count'],
      totalPages: json['total_pages'],
      totalDataCount: json['total_data_count'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'size': size,
      'page': page,
      'data_count': dataCount,
      'total_pages': totalPages,
      'total_data_count': totalDataCount,
    };
  }

}