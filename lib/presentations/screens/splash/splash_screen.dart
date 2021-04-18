import 'package:bike_store_admin_flutter/presentations/layout/base_layout/base_layout.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // await Future.delayed(const Duration(milliseconds: 1000));
      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (_) => BaseLayout(),
      // ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }
}
