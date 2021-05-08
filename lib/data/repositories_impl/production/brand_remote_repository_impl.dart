import 'package:bike_store_admin_flutter/core/api/api_request_helper.dart';
import 'package:bike_store_admin_flutter/core/api/api_url_config.dart';
import 'package:bike_store_admin_flutter/data/models/base_model.dart';
import 'package:bike_store_admin_flutter/data/models/common/page_info.dart';
import 'package:bike_store_admin_flutter/data/models/common/paged_data.dart';
import 'package:bike_store_admin_flutter/data/models/production/brand.dart';
import 'package:bike_store_admin_flutter/domain/repositories_intf/production/brand_remote_repository_intf.dart';

class BrandRemoteRepositoryImpl extends BrandRemoteRepository {
  @override
  Future<void> create({String name, String imageUrl}) async {
  }

  @override
  Future<void> delete() async {
  }

  @override
  Future<PagedData> find({
    int page = 0,
    int size = 10,
    String keyword,
  }) async {
    final path = ApiUrlConfig.brands;
    final queryParameters = {
      'page': page, 'size': size, 'keyword': keyword ?? '',
    };

    final res = await ApiRequestHelper.get(path,
      queryParameters: queryParameters,
      parseJsonData: (json) => PagedData(
        data: (json['result']['data'] as List).map((e) => Brand.fromJson(e)).toList(),
        pageInfo: PageInfo.fromJson(json['result']['page_info']),
      )
    );

    return res.result;
  }

  @override
  Future<Brand> getById(String id) async {
  }

  @override
  Future<void> update() async {
  }
}