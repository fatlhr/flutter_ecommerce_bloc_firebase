// ignore_for_file: avoid_print, prefer_const_constructors, no_duplicate_case_values

import 'package:flutter/material.dart';

import '../models/models.dart';
import '../pages/pages.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The route is ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomePage.route();
      case HomePage.routeName:
        return HomePage.route();
      case CartPage.routeName:
        return CartPage.route();
      case UserPage.routeName:
        return UserPage.route();
      case CatalogPage.routeName:
        return CatalogPage.route(category: settings.arguments as Category);
      case ProductPage.routeName:
        return ProductPage.route(product: settings.arguments as Product);
      case WishlistPage.routeName:
        return WishlistPage.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('error'),
        ),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
