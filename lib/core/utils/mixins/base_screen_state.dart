import 'package:flutter/material.dart';

mixin BaseScreenState<T extends StatefulWidget> on State<T> {

  Size size;

  bool get isMobile => size != null && size.width < 850;
  bool get isTablet => size != null && size.width >= 850 && size.width < 1100;
  bool get isDesktop => size != null && size.width > 1100;

  void safeSetState({VoidCallback fn}) {
    if (mounted) {
      setState(() {
        if (fn != null) {
          fn();
        }
      });
    }
  }

}