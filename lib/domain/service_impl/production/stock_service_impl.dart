import 'package:bike_store_admin_flutter/data/models/common/paged_data.dart';
import 'package:bike_store_admin_flutter/data/models/production/stock.dart';
import 'package:bike_store_admin_flutter/domain/repositories_intf/production/stock_remote_repository_intf.dart';
import 'package:bike_store_admin_flutter/domain/service_intf/production/stock_service.dart';

class StockServiceImpl implements StockService {
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
  Future<Stock> getById(String id) async {
    throw Exception('TODO: Implement');
  }

  @override
  Future<void> update() async {
  }
}