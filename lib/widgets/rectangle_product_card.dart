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
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartLoaded) {
                      return Container(
                        width: widthValue,
                        height: imgHeight,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(product.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    } else if (state is CartLoading) {
                      return SizedBox(
                        height: imgHeight,
                        width: imgHeight,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return Center(child: Text("Something wrong"));
                  },
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
                        return InkWell(
                          onTap: () {
                            context.read<CartBloc>().add(AddToCart(product));
                            final snackBar = SnackBar(
                              content: Text('Added to your cart!'),
                              duration: Duration(seconds: 2),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: SizedBox(
                                width: 25,
                                height: 25,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        );
                        // IconButton(
                        //   iconSize: isWishlist ? 30 : 24,
                        //   padding: EdgeInsets.zero,
                        //   icon: Icon(
                        //     Icons.add_circle_outline,
                        //     color: Colors.white,
                        //   ),
                        //   onPressed: () {
                        //     context.read<CartBloc>().add(
                        //           AddToCart(product),
                        //         );
                        //     final snackBar = SnackBar(
                        //       content: Text('Added to your cart!'),
                        //     );
                        //     ScaffoldMessenger.of(context)
                        //         .showSnackBar(snackBar);
                        //   },
                        // );
                      }
                      return SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
