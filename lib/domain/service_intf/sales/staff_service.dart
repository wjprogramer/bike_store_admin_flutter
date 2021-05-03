import 'package:bike_store_admin_flutter/data/models/common/paged_data.dart';
import 'package:bike_store_admin_flutter/data/models/sales/staff.dart';

abstract class StaffService {

  Future<void> create({
    String name,
    String imageUrl,
  });

  Future<Staff> getById(String id);

  Future<PagedData> find({
    int page = 0,
    int size = 10,
  });

  Future<void> update();

  Future<void> delete();

}