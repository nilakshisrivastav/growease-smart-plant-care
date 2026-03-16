import 'package:flutter/material.dart';
import 'package:grow_ease/models/products.dart';

class WishlistNotifier extends ChangeNotifier {
  List<Products> wishlist = [];

  void addToWishlist(Products product) {
    wishlist.add(product);
    notifyListeners();
  }

  void removeFromWishlist(Products product) {
    wishlist.remove(product);
    notifyListeners();
  }

  bool isItemInWishlist(Products product) {
    return wishlist.contains(product);
  }
}