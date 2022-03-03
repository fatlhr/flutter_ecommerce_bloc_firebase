import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';

class WishlistPage extends StatelessWidget {
  static const String routeName = '/wishlist';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const WishlistPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: "Wishlist",
      ),
      body: Center(),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
