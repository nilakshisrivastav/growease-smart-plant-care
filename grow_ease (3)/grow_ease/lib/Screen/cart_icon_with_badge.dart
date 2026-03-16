import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grow_ease/provider/cart_notifier.dart';

class CartIconWithBadge extends StatelessWidget {
  const CartIconWithBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final cartNotifier = Provider.of<CartNotifier>(context);
    final cartItemCount = cartNotifier.cartList.length;

    return Stack(
      children: [
        const Icon(Icons.shopping_cart), // Base cart icon
        if (cartItemCount > 0) // Show badge only if there are items in the cart
          Positioned(
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                '$cartItemCount', // Number of items in the cart
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}