import 'package:bike_store_admin_flutter/app/app_constants.dart';
import 'package:bike_store_admin_flutter/core/utils/mixins/base_screen_state.dart';
import 'package:bike_store_admin_flutter/core/extensions/list_extensions.dart';
import 'package:bike_store_admin_flutter/data/models/common/page_info.dart';
import 'package:bike_store_admin_flutter/data/models/common/paged_data.dart';
import 'package:bike_store_admin_flutter/data/models/production/brand.dart';
import 'package:bike_store_admin_flutter/domain/service_intf/production/brand_service.dart';
import 'package:bike_store_admin_flutter/presentations/components/screen_title.dart';
import 'package:bike_store_admin_flutter/presentations/components/vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BrandListScreen extends StatefulWidget {
  @override
  _BrandListScreenState createState() => _BrandListScreenState();
}

class _BrandListScreenState extends State<BrandListScreen> with BaseScreenState {
  var _brandService = GetIt.instance<BrandService>();
  double iconSize = 40;

  PageInfo _pageInfo = PageInfo.withInitialValue();
  List<Brand> _brands = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    try {
      PagedData res = await _brandService.find();
      _pageInfo = res.pageInfo;
      _brands = res.data;
      safeSetState();
    } catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
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
            Row(
              children: [
                Expanded(
                  child: TextField(

                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {}, 
                )
              ],
            ),
            SizedBox(height: 8,),
            _buildRow(
              children: [
                Text('ID'),
                Text('Name'),
                Text(''),
              ]
            ),
            ..._buildBrandList(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBrandList() {
    if (_brands.length == 0) {
      return [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Empty')
          ],
        ),
      ];
    } else {
      return _brands.map((e) => Container(
        child: _buildRow(
          children: [
            Text(e.id),
            Text(e.name),
            Row(
              children: [
                IconButton(icon: Icon(Icons.edit), onPressed: () {}),
              ],
            ),
          ],
        ),
      )).toList();
    }
  }

  Widget _buildRow({@required List<Widget> children}) {
    final flexList = [1, 3, 1];
    final _children = children.mapWithIndex((e, i) => Expanded(
      flex: i <= flexList.length - 1 ? flexList[i] : 1,
      child: e,
    )).toList();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(),
        ),
      ),
      child: Row(
        children: _children,
      ),
    );
  }

}
