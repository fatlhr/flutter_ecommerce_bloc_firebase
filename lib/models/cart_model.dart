// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:equatable/equatable.dart';

import 'models.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  double get subTotal => products.fold(
        0,
        (total, current) => total + current.price,
      );

  double deliveryFee(subTotal) => subTotal >= 30.0 ? 0.0 : 10.0;

  double total(subTotal, deliveryFee) => subTotal + deliveryFee(subTotal);

  String freeDeliveryFee(subTotal) {
    if (subTotal >= 30.0)
      return 'You got free delivery';
    else {
      double missing = 30.0 - subTotal;
      return 'Add \$ ${missing.toStringAsFixed(2)} for FREE delivery';
    }
  }

  String get subTotalString => subTotal.toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subTotal).toStringAsFixed(2);
  String get freeDeliveryFeeString => freeDeliveryFee(subTotal);
  String get totalString => total(subTotal, deliveryFee).toStringAsFixed(2);

  Map productQuantity(products) {
    var quantity = {};

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  @override
  List<Object?> get props => [products];
}
