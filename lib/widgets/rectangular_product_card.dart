// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../models/models.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final bool isWishlist;
  const CartProductCard(
      {Key? key, required this.product, this.isWishlist = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product',
          arguments: product,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 10.0,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0.0, 4.0),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Image.network(
              product.imageUrl,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontWeight: FontWeight.normal),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      '\$ ${product.price}',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 120,
              child: isWishlist
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          child: IconButton(
                            iconSize: 30,
                            icon: const Icon(Icons.delete_outline),
                            padding: const EdgeInsets.only(left: 8, right: 10),
                            constraints: const BoxConstraints(
                              minWidth: 0,
                              minHeight: 0,
                            ),
                            onPressed: () {
                              final snackBar = SnackBar(
                                content: Text('Deleted from wishlist'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: ElevatedButton(
                            onPressed: () {
                              final snackBar = SnackBar(
                                content: Text('Added to your cart'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                            ),
                            child: Text(
                              'ADD TO CART',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                child: IconButton(
                                  padding: const EdgeInsets.only(right: 8),
                                  constraints: const BoxConstraints(
                                    minWidth: 0,
                                    minHeight: 0,
                                  ),
                                  icon: const Icon(Icons.remove_circle_outline),
                                  onPressed: () {
                                    context
                                        .read<CartBloc>()
                                        .add(RemoveFromCart(product));
                                  },
                                ),
                              ),
                              Text(
                                '1',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              SizedBox(
                                child: IconButton(
                                  icon: const Icon(Icons.add_circle_outline),
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 10),
                                  constraints: const BoxConstraints(
                                    minWidth: 0,
                                    minHeight: 0,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<CartBloc>()
                                        .add(AddToCart(product));
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
