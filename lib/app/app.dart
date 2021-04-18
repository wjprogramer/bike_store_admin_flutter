import 'package:bike_store_admin_flutter/presentations/layout/base_layout/base_layout.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      onGenerateRoute: (_) {
        return PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 0),
          reverseTransitionDuration: const Duration(milliseconds: 0),
          pageBuilder: (_, __, ___) => BaseLayout()
        );
      },
    );
  }
}