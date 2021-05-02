import 'package:bike_store_admin_flutter/app/app_constants.dart';
import 'package:bike_store_admin_flutter/core/api/api_request_helper.dart';
import 'package:bike_store_admin_flutter/presentations/components/screen_title.dart';
import 'package:bike_store_admin_flutter/presentations/components/vertical_spacer.dart';
import 'package:flutter/material.dart';

class BrandListScreen extends StatefulWidget {
  @override
  _BrandListScreenState createState() => _BrandListScreenState();
}

class _BrandListScreenState extends State<BrandListScreen> {
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
            TextButton(
              onPressed: () async {
                try {
                  final res = await ApiRequestHelper.get('/brands');
                } catch(e) {
                  print(e);
                }
              },
              child: Text('test')
            ),
          ],
        ),
      ),
    );
  }
}
