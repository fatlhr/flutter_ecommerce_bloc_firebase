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

  const CatalogPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
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
          child: ProductCard(
            widthFactor: 2.2,
            product: categoryProducts[index],
          ),
        ),
        itemCount: categoryProducts.length,
      ),
    );
  }
}
