import 'package:bike_store_admin_flutter/app/app_constants.dart';
import 'package:bike_store_admin_flutter/core/utils/mixins/base_screen_state.dart';
import 'package:bike_store_admin_flutter/core/extensions/list_extensions.dart';
import 'package:bike_store_admin_flutter/data/models/common/page_info.dart';
import 'package:bike_store_admin_flutter/data/models/common/paged_data.dart';
import 'package:bike_store_admin_flutter/data/models/production/brand.dart';
import 'package:bike_store_admin_flutter/domain/service_intf/production/brand_service.dart';
import 'package:bike_store_admin_flutter/presentations/components/pagination.dart';
import 'package:bike_store_admin_flutter/presentations/components/screen_title.dart';
import 'package:bike_store_admin_flutter/presentations/components/search_bar.dart';
import 'package:bike_store_admin_flutter/presentations/components/vertical_spacer.dart';
import 'package:bike_store_admin_flutter/presentations/layout/base_layout/base_layout.dart';
import 'package:bike_store_admin_flutter/presentations/view_models/base_layout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class BrandListScreen extends StatefulWidget {
  @override
  _BrandListScreenState createState() => _BrandListScreenState();
}

class _BrandListScreenState extends State<BrandListScreen> with BaseScreenState {
  late BaseLayoutViewModel _baseLayoutViewModel;
  BrandService _brandService = GetIt.instance<BrandService>();

  var _keywordController = TextEditingController();

  PageInfo? _pageInfo = PageInfo.withInitialValue();
  List<Brand>? _brands = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    _loadData();
  }

  Future<void> _loadData() async {
    _isLoading = true;
    safeSetState();

    try {
      PagedData? res = await _brandService.find(
        page: _pageInfo!.page,
        size: _pageInfo!.size,
        keyword: _keywordController.text,
      );
      if (res == null) {
        return;
      }
      _pageInfo = res.pageInfo;
      _brands = res.data as List<Brand>?;
      await Future.delayed(const Duration(milliseconds: 200));
    } catch(e) {
      print(e);
    } finally {
      _isLoading = false;
      safeSetState();
    }
  }

  @override
  Widget build(BuildContext context) {
    _baseLayoutViewModel = context.watch<BaseLayoutViewModel>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMainContentHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            VerticalSpacer(),
            ScreenTitle(
              text: 'Brand',
            ),
            SearchBar(
              onSearch: () {
                _loadData();
              },
              keywordController: _keywordController,
            ),
            SizedBox(height: 32,),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Brands",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DataTable(
                      horizontalMargin: 0,
                      columnSpacing: 16.0,
                      columns: [
                        DataColumn(
                          label: Text("ID"),
                        ),
                        DataColumn(
                          label: Text("Name"),
                        ),
                        DataColumn(
                          label: Text("Actions"),
                        ),
                      ],
                      rows: List.generate(_pageInfo!.size!, (index) {
                        if (index < _brands!.length) {
                          return _brands![index];
                        } else {
                          return null;
                        }
                      }).map(_brandDataRow).toList(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32,),
            Center(
              child: Pagination(
                pageInfo: _pageInfo,
                onPageChanged: (page) {
                  _pageInfo!.page = page;
                  _loadData();
                },
              ),
            ),
            SizedBox(height: 64,),
          ],
        ),
      ),
    );
  }

  DataRow _brandDataRow(Brand? brand) {
    var cells;
    if (brand != null) {
      cells = [
        DataCell(Text(brand.id!),),
        DataCell(Text(brand.name!)),
        DataCell(Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                BaseLayout.routerDelegate!.goBrand(brand.id.toString());
              },
            ),
          ],
        )),
      ];
    } else {
      cells = List.generate(3, (index) => DataCell(Text('')));
    }

    return DataRow(
      cells: cells,
    );
  }

}
