import 'package:bike_store_admin_flutter/app/app_constants.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Widget child;

  MyCard({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: child,
    );
  }
}
