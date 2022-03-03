// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';

class WishlistPage extends StatelessWidget {
  static const String routeName = '/wishlist';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const WishlistPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  final double widthFactor;

  const WishlistPage({Key? key, this.widthFactor = 2.5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Wishlist",
      ),
      bottomNavigationBar: CustomNavBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WishlistLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2.2,
              ),
              itemCount: state.wishlist.products.length,
              itemBuilder: (BuildContext context, int index) => Center(
                child: SizedBox(
                  height: widthValue + 80,
                  child: ProductCard(
                    imgHeight: 135,
                    widthFactor: 1.1,
                    isWishlist: true,
                    product: state.wishlist.products[index],
                  ),
                ),
              ),
            );
          }
          return Center(
            child: Text("Something wrong..."),
          );
        },
      ),
    );
  }
}
