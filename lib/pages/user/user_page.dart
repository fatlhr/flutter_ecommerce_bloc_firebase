import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';

class UserPage extends StatelessWidget {
  static const String routeName = '/user';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const UserPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: "User",
      ),
      body: Center(),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
