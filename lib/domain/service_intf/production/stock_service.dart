import 'package:bike_store_admin_flutter/data/models/common/paged_data.dart';
import 'package:bike_store_admin_flutter/data/models/production/stock.dart';

abstract class StockService {

  Future<void> create({
    String name,
    String imageUrl,
  });

  Future<Stock> getById(String id);

  Future<PagedData> find({
    int page = 0,
    int size = 10,
  });

  Future<void> update();

  Future<void> delete();

}