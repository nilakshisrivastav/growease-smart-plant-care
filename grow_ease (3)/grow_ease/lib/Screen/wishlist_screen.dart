import 'package:flutter/material.dart';
import 'package:grow_ease/provider/wishlist_notifier.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var wishlistNotifier = Provider.of<WishlistNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
      ),
      body: wishlistNotifier.wishlist.isEmpty
          ? const Center(child: Text("Your wishlist is empty"))
          : ListView.builder(
              itemCount: wishlistNotifier.wishlist.length,
              itemBuilder: (context, index) {
                var item = wishlistNotifier.wishlist[index];
                return ListTile(
                  leading: Image.network(item.p_img),
                  title: Text(item.p_name),
                  subtitle: Text("Rs.${item.p_price}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      wishlistNotifier.removeFromWishlist(item);
                    },
                  ),
                );
              },
            ),
    );
  }
}