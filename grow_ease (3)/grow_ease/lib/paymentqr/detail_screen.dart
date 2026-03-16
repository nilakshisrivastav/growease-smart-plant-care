import 'package:flutter/material.dart';
import 'package:grow_ease/paymentqr/qr_screen.dart';
import 'package:grow_ease/provider/cart_notifier.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    // Accessing CartNotifier
    final cartNotifier = Provider.of<CartNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("QR Generate"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Generate Payment QR Code",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Text(
              "Total Payment: Rs.${cartNotifier.totalprice()}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to QR code screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QrCodeScreen(),
                  ),
                );
              },
              child: const Text(
                "Generate QR Code",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}