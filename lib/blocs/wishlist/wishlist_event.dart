part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class StartWishlist extends WishlistEvent {}

class AddToWishlist extends WishlistEvent {
  final Product product;

  const AddToWishlist(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveFromWishlist extends WishlistEvent {
  final Product product;

  const RemoveFromWishlist(this.product);

  @override
  List<Object> get props => [product];
}
