import 'package:flutter/material.dart';

mixin BaseScreenState<T extends StatefulWidget> on State<T> {

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