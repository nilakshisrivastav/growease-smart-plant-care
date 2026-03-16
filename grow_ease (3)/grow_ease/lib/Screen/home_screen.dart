import 'package:flutter/material.dart';
import 'package:grow_ease/Screen/cart_screen.dart';
import 'package:grow_ease/Screen/spring_season.dart';
import 'package:grow_ease/Screen/summer_season.dart';
import 'package:grow_ease/Screen/winter_season.dart';
import 'package:grow_ease/Screen/signin_screen.dart'; // Import SignInScreen

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.home_filled, size: 30),
            Text(
              "Home",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: [
          // Cart Icon Button
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
              size: 40,
            ),
          ),
          // Logout Button (AppBar)
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const SignInScreen()),
              );
            },
            icon: const Icon(
              Icons.logout,
              size: 35,
              color: Colors.white,
            ),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.category_outlined, size: 28, color: Colors.pink),
                SizedBox(width: 8),
                Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Summer Season Category
            InkWell(
              child: Container(
                margin: const EdgeInsets.only(bottom: 11),
                height: 80,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(115, 230, 179, 227),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Summer Season",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/summer.jpg"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SummerSeason()),
                );
              },
            ),

            // Winter Season Category
            InkWell(
              child: Container(
                margin: const EdgeInsets.only(bottom: 11),
                height: 80,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(115, 239, 161, 233),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Winter Season",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/Winter.jpg"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WinterSeason()),
                );
              },
            ),

            // Spring Season Category
            InkWell(
              child: Container(
                margin: const EdgeInsets.only(bottom: 11),
                height: 80,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(115, 237, 131, 230),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Spring Season",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/Spring.jpg"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SpringSeason()),
                );
              },
            ),

            const SizedBox(height: 25),

            // Logout Button (Body)
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const SignInScreen()),
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                textStyle: const TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
