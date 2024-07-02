import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_files/models/product.dart';
import 'package:riverpod_files/providers/products_provider.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Set<Product> build() {
    return {};
  }

  void addToCart(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeFromCart(Product product) {
    if (state.contains(product)) {
      state = state.where((element) => element.id != product.id).toSet();
    }
  }
}

@riverpod
int cartTotal(ref) {
  cartProducts = ref.watch(CartNotifierProvider);

  int total;

  for (Product produt in cartProducts) {
    total += produt.price;
  }
}
