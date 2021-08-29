import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  ScreenTitle({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme.headline1;
    return Container(
      child: Text(
        text, style: theme,
      ),
    );
  }
}
