// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../config/theme.dart';
import '../models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double imgHeight;
  //final bool additionalButton;
  final bool isWishlist;

  const ProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 3.5,
    //this.additionalButton = false,
    this.imgHeight = 150,
    this.isWishlist = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product',
          arguments: product,
        );
      },
      child: Container(
        height: widthValue + 50,
        padding: EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 8.0),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: widthValue,
                  height: imgHeight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(product.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: textTheme().headline4!.copyWith(
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
                )
              ],
            ),
            Positioned(
              top: isWishlist ? null : -5,
              right: 0,
              bottom: isWishlist ? -5 : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoaded) {
                        return IconButton(
                          iconSize: isWishlist ? 30 : 24,
                          padding: EdgeInsets.zero,
                          icon: Icon(Icons.add_circle_outlined,
                              color: Colors.black),
                          onPressed: () {
                            context.read<CartBloc>().add(
                                  AddToCart(product),
                                );
                            final snackBar = SnackBar(
                              content: Text('Added to your cart!'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                        );
                      } else if (state is CartLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Center(child: Text("Something wrong"));
                    },
                  ),
                  isWishlist
                      ? IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(Icons.delete, color: Colors.black),
                          iconSize: 30,
                          onPressed: () {
                            final snackBar = SnackBar(
                              content: Text('Removed from your Wishlist!'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),

      // Stack(
      //   children: [
      //     SizedBox(
      //       width: widthValue,
      //       height: widthValue,
      //       child: Image.network(
      //         product.imageUrl,
      //         fit: BoxFit.cover,
      //       ),
      //     ),
      //     Positioned(
      //       bottom: 5,
      //       left: 5,
      //       child: Container(
      //         width: widthValue - 10,
      //         height: 75,
      //         decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
      //       ),
      //     ),
      //     Positioned(
      //       bottom: 0,
      //       left: 0,
      //       child: Container(
      //         width: widthValue - 15,
      //         height: 70,
      //         alignment: Alignment.bottomLeft,
      //         decoration: BoxDecoration(color: Colors.black),
      //         child: Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Column(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     product.name,
      //                     style: textTheme()
      //                         .headline6!
      //                         .copyWith(color: Colors.white),
      //                     maxLines: 2,
      //                   ),
      //                   Text(
      //                     'Rp. ${product.price}',
      //                     style: textTheme()
      //                         .headline4!
      //                         .copyWith(color: Colors.white),
      //                   ),
      //                 ],
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.end,
      //                 children: [
      //                   IconButton(
      //                     icon: Icon(Icons.add_circle, color: Colors.white),
      //                     onPressed: () {
      //                       final snackBar = SnackBar(
      //                         content: Text('Added to your cart!'),
      //                       );
      //                       ScaffoldMessenger.of(context)
      //                           .showSnackBar(snackBar);
      //                     },
      //                   ),
      //                   additionalButton
      //                       ? IconButton(
      //                           padding: EdgeInsets.zero,
      //                           icon: Icon(Icons.delete, color: Colors.white),
      //                           onPressed: () {
      //                             final snackBar = SnackBar(
      //                               content:
      //                                   Text('Removed from your Wishlist!'),
      //                             );
      //                             ScaffoldMessenger.of(context)
      //                                 .showSnackBar(snackBar);
      //                           },
      //                         )
      //                       : SizedBox(),
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
