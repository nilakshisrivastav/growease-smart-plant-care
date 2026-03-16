import 'package:flutter/material.dart';
import 'package:grow_ease/Screen/cart_screen.dart';
import 'package:grow_ease/Screen/wishlist_screen.dart'; // Import WishlistScreen
import 'package:grow_ease/data/products_data.dart'; // Import product data
import 'package:grow_ease/provider/cart_notifier.dart'; // Import CartNotifier
import 'package:grow_ease/provider/wishlist_notifier.dart'; // Import WishlistNotifier
import 'package:grow_ease/Screen/cart_icon_with_badge.dart'; // Import reusable CartIcon
import 'package:grow_ease/Screen/plant_detail_page.dart'; // Import PlantDetailPage
import 'package:provider/provider.dart';

class WinterSeason extends StatefulWidget {
  const WinterSeason({super.key});

  @override
  State<WinterSeason> createState() => _WinterSeasonState();
}

int screenIndex = 1; // Define screen index for WinterSeason list

class _WinterSeasonState extends State<WinterSeason> {
  @override
  Widget build(BuildContext context) {
    // Access CartNotifier and WishlistNotifier using Provider
    var cartNotifier = Provider.of<CartNotifier>(context);
    var wishlistNotifier = Provider.of<WishlistNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Winter Season"),
        actions: [
          // Cart Icon with Badge
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CartIconWithBadge(),
            ),
          ),
          // Wishlist Icon in AppBar
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const WishlistScreen()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.favorite, color: Colors.red, size: 30),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: WinterSeason_list.length,
        itemBuilder: (context, index) {
          // Check if the item is in the wishlist
          bool isWishlisted = wishlistNotifier.isItemInWishlist(WinterSeason_list[index]);

          return Container(
            color: const Color.fromARGB(66, 88, 225, 225),
            child: Card(
              child: InkWell(
                onTap: () {
                  // Navigate to Plant Detail Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlantDetailPage(plant: WinterSeason_list[index]),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Image.network(
                      WinterSeason_list[index].p_img,
                      width: MediaQuery.of(context).size.width / 2.2 - 100,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            WinterSeason_list[index].p_name,
                            style: const TextStyle(fontWeight: FontWeight.w800),
                          ),
                          Text(
                            "Rs.${WinterSeason_list[index].p_price}",
                            style: const TextStyle(fontWeight: FontWeight.w800),
                          ),
                          Text(
                            WinterSeason_list[index].p_benefits,
                            style: const TextStyle(fontWeight: FontWeight.w800),
                          ),
                          Row(
                            children: [
                              // Add to Cart Button
                              InkWell(
                                onTap: () {
                                  cartNotifier.addToCart(screenIndex, index);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "${WinterSeason_list[index].p_name} added to cart!",
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.add_shopping_cart_outlined, color: Colors.white),
                                      SizedBox(width: 8),
                                      Text(
                                        "Add to cart",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Wishlist Button
                              IconButton(
                                icon: Icon(
                                  isWishlisted ? Icons.favorite : Icons.favorite_border,
                                  color: isWishlisted ? Colors.red : Colors.grey,
                                ),
                                onPressed: () {
                                  if (isWishlisted) {
                                    wishlistNotifier.removeFromWishlist(WinterSeason_list[index]);
                                  } else {
                                    wishlistNotifier.addToWishlist(WinterSeason_list[index]);
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}