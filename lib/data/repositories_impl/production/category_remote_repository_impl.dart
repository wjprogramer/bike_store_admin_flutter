import 'package:bike_store_admin_flutter/data/models/common/paged_data.dart';
import 'package:bike_store_admin_flutter/data/models/production/category.dart';
import 'package:bike_store_admin_flutter/domain/repositories_intf/production/category_remote_repository_intf.dart';

class CategoryRemoteRepositoryImpl implements CategoryRemoteRepository {
  @override
  Future<void> create({String name, String imageUrl}) async {
  }

  @override
  Future<void> delete() async {
  }

  @override
  Future<PagedData> find({int page = 0, int size = 10}) async {
  }

  @override
  Future<Category> getById(String id) async {
  }

  @override
  Future<void> update() async {
  }
}