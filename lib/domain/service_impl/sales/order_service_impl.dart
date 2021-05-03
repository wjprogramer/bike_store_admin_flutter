import 'package:bike_store_admin_flutter/data/models/common/paged_data.dart';
import 'package:bike_store_admin_flutter/data/models/sales/order.dart';
import 'package:bike_store_admin_flutter/domain/service_intf/sales/order_service.dart';

class OrderServiceImpl implements OrderService {
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
  Future<Order> getById(String id) async {
  }

  @override
  Future<void> update() async {
  }
}