// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_bloc_firebase/models/product_model.dart';

import '../../widgets/widgets.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: "Cart",
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                width: MediaQuery.of(context).size.width / 2.5,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: Text(
                    'LETS CHECKOUT!',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Add \$20 for FREE delivery',
                  style: Theme.of(context).textTheme.headline4,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text(
                    'Add more items',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 60,
              bottom: 120,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                child: Wrap(
                  children: [
                    CardProductCard(product: Product.products[0]),
                    CardProductCard(product: Product.products[1]),
                    CardProductCard(product: Product.products[0]),
                    CardProductCard(product: Product.products[1]),
                    //CardProductCard(product: Product.products[1]),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Divider(thickness: 2),
                    SizedBox(height: 5.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "SUBTOTAL",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text(
                            "\$120.00",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "DELIVERY FEE",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text(
                            "\$120.00",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            right: 8,
                            top: 8,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.black.withAlpha(50),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "TOTAL",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(color: Colors.white),
                                ),
                                Text(
                                  "\$120.00",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
