// ignore_for_file: avoid_print, prefer_const_constructors, no_duplicate_case_values

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_bloc_firebase/models/category_model.dart';

import '../pages/cart/cart_page.dart';
import '../pages/catalog/catalog_page.dart';
import '../pages/home/home_page.dart';
import '../pages/product/product_page.dart';
import '../pages/user/user_page.dart';
import '../pages/wishlist/wishlist_page.dart';

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
        return ProductPage.route();
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
