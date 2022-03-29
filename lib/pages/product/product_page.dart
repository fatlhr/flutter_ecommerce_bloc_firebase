// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_bloc_firebase/widgets/widgets.dart';

import '../../blocs/blocs.dart';
import '../../config/theme.dart';
import '../../models/models.dart';

class ProductPage extends StatelessWidget {
  static const String routeName = '/product';
  static Route route({required Product product}) {
    return MaterialPageRoute(
      builder: (_) => ProductPage(product: product),
      settings: const RouteSettings(name: routeName),
    );
  }

  final Product product;

  const ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _btnFav = Icon(Icons.favorite_border, color: Colors.white);

    return Scaffold(
      appBar: CustomAppBar(
        title: product.name,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.share_rounded,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  return IconButton(
                    icon: _btnFav,
                    onPressed: () {
                      context.read<WishlistBloc>().add(AddToWishlist(product));
                      _btnFav = Icon(Icons.favorite, color: Colors.red);
                      final snackBar = SnackBar(
                        content: Text('Add to Wishlist!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  );
                },
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<CartBloc>().add(AddToCart(product));
                        Navigator.pushNamed(context, '/cart');
                        final snackBar = SnackBar(
                          content: Text('Successfully Add to Cart'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      child: Text(
                        'ADD TO CART',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: false,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              initialPage: 1,
            ),
            items: [
              HeroCarouselCard(product: product),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    right: 8,
                    top: 8,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(50),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            product.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                          ),
                        ),
                        Text(
                          '\$${product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  'Product Information',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'Lorem ipsum dolor sit amet, maiorum delicatissimi quo et, homero adversarium instructior vim an, ex quo prima voluptua maluisset. Quod aliquip id duo, eum noster possim an. Suavitate abhorreant ex sit. Has cu aperiam dissentiet. No est purto inani principes, veritus ocurreret te mel, accusam nominavi mel cu. Nam ne sint soleat, mei id decore invenire, novum primis principes ne sit.',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: SizedBox(height: 10, child: Divider()),
          ),
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  'Delivery Information',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'Lorem ipsum dolor sit amet, maiorum delicatissimi quo et, homero adversarium instructior vim an, ex quo prima voluptua maluisset. Quod aliquip id duo, eum noster possim an. Suavitate abhorreant ex sit. Has cu aperiam dissentiet. No est purto inani principes, veritus ocurreret te mel, accusam nominavi mel cu. Nam ne sint soleat, mei id decore invenire, novum primis principes ne sit.',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
