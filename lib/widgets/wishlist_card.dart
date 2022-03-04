// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../config/theme.dart';
import '../models/models.dart';

class WishlistCard extends StatelessWidget {
  final Product product;
  final double imgHeight;

  const WishlistCard({
    Key? key,
    required this.product,
    this.imgHeight = 150,
  }) : super(key: key);

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
        height: imgHeight,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(right: 10, left: 10, bottom: 10.0),
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
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: imgHeight,
                  height: imgHeight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(product.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "\$ ${product.price}",
                      style: textTheme().headline3!,
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: -5,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    iconSize: 30,
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.add_circle_outlined, color: Colors.black),
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: Text('Added to your cart!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.delete, color: Colors.black),
                    iconSize: 30,
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: Text('Removed from your Wishlist!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
