import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_bloc_firebase/widgets/widgets.dart';

import '../models/models.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  final double widthFactor;
  const ProductCarousel({
    Key? key,
    required this.products,
    this.widthFactor = 2.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return SizedBox(
      height: widthValue,
      child: ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ProductCard(
            product: products[index],
          ),
        ),
      ),
    );
  }
}
