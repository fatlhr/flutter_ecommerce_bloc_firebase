// ignore_for_file: prefer_const_constructors

import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories = [
    Category(name: 'Soft Drink', imageUrl: 'https://picsum.photos/200'),
    Category(name: 'Smoothies', imageUrl: 'https://picsum.photos/200'),
    Category(name: 'Water', imageUrl: 'https://picsum.photos/200'),
  ];
}
