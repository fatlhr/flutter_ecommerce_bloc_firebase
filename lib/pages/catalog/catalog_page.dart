// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';

class CatalogPage extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => CatalogPage(category: category),
    );
  }

  final Category category;
  final double widthFactor;

  const CatalogPage({Key? key, required this.category, this.widthFactor = 2.5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    // list of products by category
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();

    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      bottomNavigationBar: CustomNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemBuilder: (BuildContext context, int index) => Center(
          child: SizedBox(
            height: widthValue + 80,
            child: ProductCard(
              imgHeight : 150,
              widthFactor: 2.5,
              product: categoryProducts[index],
            ),
          ),
        ),
        itemCount: categoryProducts.length,
      ),
    );
  }
}
