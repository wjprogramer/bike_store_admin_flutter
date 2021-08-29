import 'package:bike_store_admin_flutter/data/models/common/paged_data.dart';
import 'package:bike_store_admin_flutter/data/models/sales/order.dart';
import 'package:bike_store_admin_flutter/domain/repositories_intf/sales/order_remote_repository_intf.dart';

class OrderRemoteRepositoryImpl implements OrderRemoteRepository {
  @override
  Future<void> create({String? name, String? imageUrl}) async {
  }

  @override
  Future<void> delete() async {
  }

  @override
  Future<PagedData> find({int page = 0, int size = 10}) async {
    throw Exception('TODO: Implement');
  }

  @override
  Future<Order> getById(String id) async {
    throw Exception('TODO: Implement');
  }

  @override
  Future<void> update() async {
  }
}