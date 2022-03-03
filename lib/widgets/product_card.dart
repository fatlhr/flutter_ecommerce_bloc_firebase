// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../config/theme.dart';
import '../models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final bool additionalButton;

  const ProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 2.5,
    this.additionalButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          SizedBox(
            width: widthValue,
            height: widthValue,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 5,
            left: 5,
            child: Container(
              width: widthValue - 10,
              height: 75,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: widthValue - 15,
              height: 70,
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: textTheme()
                              .headline6!
                              .copyWith(color: Colors.white),
                          maxLines: 2,
                        ),
                        Text(
                          'Rp. ${product.price}',
                          style: textTheme()
                              .headline4!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(Icons.add_circle, color: Colors.white),
                          onPressed: () {
                            final snackBar = SnackBar(
                              content: Text('Added to your cart!'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                        ),
                        additionalButton
                            ? IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.delete, color: Colors.white),
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content:
                                        Text('Removed from your Wishlist!'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                              )
                            : SizedBox(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
