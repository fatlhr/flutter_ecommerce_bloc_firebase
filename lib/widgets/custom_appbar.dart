// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_bloc_firebase/config/theme.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool isHome;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.isHome = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: isHome ? false : true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Center(
        child: Text(
          title,
          style: textTheme().headline2,
        ),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
          icon: Icon(Icons.shopping_cart),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
