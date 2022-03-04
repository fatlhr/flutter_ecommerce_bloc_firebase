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
        imageUrl: 'https://picsum.photos/200',
        price: 10000,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Soft Drink #2',
        category: 'Soft Drink',
        imageUrl: 'https://picsum.photos/200',
        price: 10000,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Soft Drink #3',
        category: 'Smoothies',
        imageUrl: 'https://picsum.photos/200',
        price: 10000,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Soft Drink #4',
        category: 'Water',
        imageUrl: 'https://picsum.photos/200',
        price: 10000,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Soft Drink #5',
        category: 'Soft Drink',
        imageUrl: 'https://picsum.photos/200',
        price: 10000,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Soft Drink #6',
        category: 'Soft Drink',
        imageUrl: 'https://picsum.photos/200',
        price: 10000,
        isRecommended: true,
        isPopular: true),
  ];
}
