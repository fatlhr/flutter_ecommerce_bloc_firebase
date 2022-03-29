import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final num price;
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

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      isRecommended: snap['isRecommended'],
      isPopular: snap['isPopular'],
    );
    return product;
  }

  @override
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        isRecommended,
        isPopular,
      ];

  static List<Product> products = [
    const Product(
        name: 'Soft Drink #1',
        category: 'Soft Drink',
        imageUrl: 'https://picsum.photos/200',
        price: 10,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Soft Drink #2',
        category: 'Soft Drink',
        imageUrl: 'https://picsum.photos/200',
        price: 10,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Soft Drink #3',
        category: 'Smoothies',
        imageUrl: 'https://picsum.photos/200',
        price: 10,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Soft Drink #4',
        category: 'Water',
        imageUrl: 'https://picsum.photos/200',
        price: 10,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Soft Drink #5',
        category: 'Soft Drink',
        imageUrl: 'https://picsum.photos/200',
        price: 10,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Soft Drink #6',
        category: 'Soft Drink',
        imageUrl: 'https://picsum.photos/200',
        price: 10,
        isRecommended: true,
        isPopular: true),
  ];
}
