// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_bloc_firebase/models/wishlist_model.dart';

import '../../models/models.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading());

  Stream<WishlistState> mapEventToState(
    WishlistEvent event,
  ) async* {
    if (event is StartWishlist) {
      yield* _mapStartWishlistToState();
    } else if (event is AddToWishlist) {
      yield* _mapAddToWishlistToState(event, state);
    }
    if (event is RemoveFromWishlist) {
      yield* _mapRemoveFromWishlistToState(event, state);
    }
  }

  Stream<WishlistState> _mapStartWishlistToState() async* {
    yield WishlistLoading();
    try {
      await Future<void>.delayed(Duration(seconds: 2));
      yield WishlistLoaded();
    } catch (_) {}
  }

  Stream<WishlistState> _mapAddToWishlistToState(
      AddToWishlist event, WishlistState state) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
          wishlist: Wishlist(
              products: List.from(state.wishlist.products)..add(event.product)),
        );
      } catch (_) {}
    }
  }

  Stream<WishlistState> _mapRemoveFromWishlistToState(
      RemoveFromWishlist event, WishlistState state) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
          wishlist: Wishlist(
              products: List.from(state.wishlist.products)
                ..remove(event.product)),
        );
      } catch (_) {}
    }
  }
}
