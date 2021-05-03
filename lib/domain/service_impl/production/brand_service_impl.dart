import 'package:bike_store_admin_flutter/data/models/common/paged_data.dart';
import 'package:bike_store_admin_flutter/data/models/production/brand.dart';
import 'package:bike_store_admin_flutter/domain/repositories_intf/production/brand_remote_repository_intf.dart';
import 'package:bike_store_admin_flutter/domain/service_intf/production/brand_service.dart';
import 'package:flutter/foundation.dart';

class BrandServiceImpl implements BrandService {
  final BrandRemoteRepository _brandRemoteRepository;

  BrandServiceImpl({
    @required BrandRemoteRepository repository,
  }): _brandRemoteRepository = repository;

  @override
  Future<void> create({String name, String imageUrl}) async {
  }

  @override
  Future<void> delete() async {
  }

  @override
  Future<PagedData> find({int page = 0, int size = 10}) async {
    return _brandRemoteRepository.find();
  }

  @override
  Future<Brand> getById(String id) async {
    return _brandRemoteRepository.getById(id);
  }

  @override
  Future<void> update() async {
  }
}