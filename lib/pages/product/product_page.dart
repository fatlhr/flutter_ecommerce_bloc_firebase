import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';

class ProductPage extends StatelessWidget {
  static const String routeName = '/product';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const ProductPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: "Product",
      ),
      body: Center(),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
