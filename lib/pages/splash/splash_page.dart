import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = '/user';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SplashPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, '/'));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/logoipsum_39.png',
              width: 300,
              height: 120,
              scale: 0.5,
            ),
          ),
          Center(
            child: Text(
              "ECOMMERCE APP",
              style: Theme.of(context).textTheme.headline2,
            ),
          )
        ],
      ),
    );
  }
}
