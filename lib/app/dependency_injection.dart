import 'package:bike_store_admin_flutter/data/repositories_impl/production/brand_remote_repository_impl.dart';
import 'package:bike_store_admin_flutter/domain/repositories_intf/production/brand_remote_repository_intf.dart';
import 'package:bike_store_admin_flutter/domain/service_impl/production/brand_service_impl.dart';
import 'package:bike_store_admin_flutter/domain/service_intf/production/brand_service.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  final sl = GetIt.instance;

  // Repository
  sl.registerLazySingleton<BrandRemoteRepository>(() => BrandRemoteRepositoryImpl());

  // Service
  sl.registerLazySingleton<BrandService>(() => BrandServiceImpl(repository: sl()));

}