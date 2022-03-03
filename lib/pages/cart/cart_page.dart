import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';

class CartPage extends StatelessWidget {
  static const String routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const CartPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: "Cart",
      ),
      body: Center(),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
