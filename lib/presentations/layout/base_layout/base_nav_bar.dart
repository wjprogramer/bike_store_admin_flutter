import 'package:bike_store_admin_flutter/core/utils/mixins/base_screen_state.dart';
import 'package:bike_store_admin_flutter/presentations/view_models/base_layout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseNavBar extends StatefulWidget {
  final bool isMobile;

  BaseNavBar({
    @required this.isMobile
  });

  @override
  _BaseNavBarState createState() => _BaseNavBarState();
}

class _BaseNavBarState extends State<BaseNavBar> {
  BaseLayoutViewModel _baseLayoutViewModel;

  @override
  Widget build(BuildContext context) {
    _baseLayoutViewModel = context.watch<BaseLayoutViewModel>();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Row(
        children: [
          if (widget.isMobile)
            IconButton(
              onPressed: () {
                _baseLayoutViewModel.toggleDrawer();
              },
              icon: Icon(Icons.menu),
            ),
          Expanded(child: SizedBox()),
          Icon(
            Icons.logout,
          ),
        ],
      ),
    );
  }
}
