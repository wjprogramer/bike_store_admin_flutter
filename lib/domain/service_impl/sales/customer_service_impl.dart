import 'package:bike_store_admin_flutter/data/models/common/paged_data.dart';
import 'package:bike_store_admin_flutter/data/models/sales/customer.dart';
import 'package:bike_store_admin_flutter/domain/service_intf/sales/customer_service.dart';

class CustomerServiceImpl implements CustomerService {
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
  Future<Customer> getById(String id) async {
    throw Exception('TODO: Implement');
  }

  @override
  Future<void> update() async {
  }
}