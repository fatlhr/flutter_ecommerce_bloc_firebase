import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular];

  static List<Product> products = [
    const Product(
        name: 'Soft Drink #1',
        category: 'Soft Drink',
        imageUrl:
            'https://images.unsplash.com/photo-1479716809603-a2aba5be4585?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
        price: 10000,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Soft Drink #2',
        category: 'Soft Drink',
        imageUrl:
            'https://images.unsplash.com/photo-1479716809603-a2aba5be4585?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
        price: 10000,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Soft Drink #3',
        category: 'Smoothies',
        imageUrl:
            'https://images.unsplash.com/photo-1479716809603-a2aba5be4585?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
        price: 10000,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Soft Drink #4',
        category: 'Water',
        imageUrl:
            'https://images.unsplash.com/photo-1479716809603-a2aba5be4585?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
        price: 10000,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Soft Drink #5',
        category: 'Soft Drink',
        imageUrl:
            'https://images.unsplash.com/photo-1479716809603-a2aba5be4585?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
        price: 10000,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Soft Drink #6',
        category: 'Soft Drink',
        imageUrl:
            'https://images.unsplash.com/photo-1479716809603-a2aba5be4585?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
        price: 10000,
        isRecommended: true,
        isPopular: true),
  ];
}
