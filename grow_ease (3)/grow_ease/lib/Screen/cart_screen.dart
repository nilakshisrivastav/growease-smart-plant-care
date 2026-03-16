import 'package:flutter/material.dart';
import 'package:grow_ease/paymentqr/detail_screen.dart';
import 'package:grow_ease/provider/cart_notifier.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var cartNotifier = Provider.of<CartNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                const Icon(Icons.shopping_cart),
                if (cartNotifier.cartList.isNotEmpty) // Only show badge if cart has items
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
                        '${cartNotifier.cartList.length}', // Number of items in the cart
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
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartNotifier.cartList.length,
              itemBuilder: (context, index) {
                return Container(
                  color: const Color.fromARGB(66, 88, 225, 225),
                  child: Card(
                    child: Row(
                      children: [
                        Image.network(
                          cartNotifier.cartList[index].p_img,
                          width: MediaQuery.of(context).size.width / 2.0 - 100,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartNotifier.cartList[index].productName,
                                style: const TextStyle(fontWeight: FontWeight.w800),
                              ),
                              Text(
                                "Rs.${cartNotifier.cartList[index].productAmount}",
                                style: const TextStyle(fontWeight: FontWeight.w800),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      cartNotifier.addqty(index);
                                    },
                                    icon: const Icon(Icons.exposure_plus_1),
                                  ),
                                  Text(
                                    cartNotifier.cartList[index].productQty
                                        .toString(),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      cartNotifier.subqty(index);
                                    },
                                    icon: const Icon(Icons.exposure_minus_1),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.pink[400],
            height: 140,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      height: 40,
                      width: 110,
                      child: const Center(
                        child: Text(
                          "Total price:",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text(
                        "Rs.${cartNotifier.totalprice()}",
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Checkout!",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}