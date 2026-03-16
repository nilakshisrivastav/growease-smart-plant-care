import 'package:flutter/material.dart';
import 'package:grow_ease/data/products_data.dart';
import 'package:grow_ease/models/cart_model.dart';

class CartNotifier extends ChangeNotifier {
  // Dynamic list to store cart items
  List<CartModel> cartList = [];

  // Function to increase the quantity of an item in the cart
  addqty(index) {
    cartList[index].productQty++;
    cartList[index].productAmount = cartList[index].productAmount * cartList[index].productQty;
    notifyListeners();
  }

  // Function to decrease the quantity of an item in the cart
  subqty(index) {
    cartList[index].productQty--;
    if (cartList[index].productQty <= 0) {
      cartList.removeAt(index); // Remove the item if quantity is zero
    } else {
      cartList[index].productAmount = cartList[index].productAmount * cartList[index].productQty;
    }
    notifyListeners();
  }

  // Function to add an item to the cart
  addToCart(screen, index) {
    var currItem = products_list[screen][index]; // Get the item from the products list
    bool found = false;

    for (var item in cartList) {
      if (item.id == currItem.p_id) {
        found = true;
        item.productQty++; // Increase quantity if the item is already in the cart
        notifyListeners();
        break;
      }
    }

    // If the item is not found in the cart, add it as a new item
    if (!found) {
      cartList.add(CartModel(
        p_img: currItem.p_img,
        id: currItem.p_id,
        productName: currItem.p_name,
        productAmount: currItem.p_price,
        productbenefits: currItem.p_benefits,
        productQty: 1, // Set default quantity to 1
      ));
      notifyListeners();
    }
  }

  // Function to calculate the total price of items in the cart
  totalprice() {
    double price = 0.0;
    for (var item in cartList) {
      price += item.productAmount * item.productQty; // Calculate total price
    }
    return price.toStringAsFixed(2); // Return the price as a formatted string
  }

  // Function to clear the cart
  clearCart() {
    cartList.clear(); // Clear all items from the cart
    notifyListeners();
  }
}