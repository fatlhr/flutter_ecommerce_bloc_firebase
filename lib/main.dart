// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_bloc_firebase/config/app_router.dart';
import 'package:flutter_ecommerce_bloc_firebase/widgets/custom_appbar.dart';
import 'package:flutter_ecommerce_bloc_firebase/widgets/custom_navbar.dart';

import 'pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomePage.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}