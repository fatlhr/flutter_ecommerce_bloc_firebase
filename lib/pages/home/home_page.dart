// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/blocs.dart';
import '../../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomePage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Ecommerce",
      ),
      bottomNavigationBar: CustomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      initialPage: 1,
                    ),
                    items: state.categories
                        .map((e) => HeroCarouselCard(category: e))
                        .toList(),
                  );
                } else if (state is CategoryLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return Center(
                  child: Text('Something went wrong...'),
                );
              },
            ),
            SectionTitle(title: 'RECOMMENDED'),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoaded) {
                  return ProductCarousel(
                    products: state.products
                        .where((product) => product.isRecommended)
                        .toList(),
                  );
                } else if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return Center(
                  child: Text('Something went wrong...'),
                );
              },
            ),
            SizedBox(height: 10),
            SectionTitle(title: 'POPULAR'),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoaded) {
                  return ProductCarousel(
                    products: state.products
                        .where((product) => product.isPopular)
                        .toList(),
                  );
                } else if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return Center(
                  child: Text('Something went wrong...'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
