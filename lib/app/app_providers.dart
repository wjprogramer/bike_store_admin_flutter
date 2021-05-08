import 'package:bike_store_admin_flutter/presentations/view_models/base_layout_view_model.dart';
import 'package:provider/provider.dart';

getProviders() {
  final providers = [
    ChangeNotifierProvider(
      create: (_) => BaseLayoutViewModel(),
    ),
  ];
  return providers;
}