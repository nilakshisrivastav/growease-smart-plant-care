import 'package:flutter/material.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';
import 'package:provider/provider.dart';
import 'package:grow_ease/provider/cart_notifier.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  late UPIDetails upiDetails;

  @override
  void initState() {
    super.initState();
    // Setting up UPI Details will be done in the build method
  }

  @override
  Widget build(BuildContext context) {
    // Fetch the total cart amount dynamically from CartNotifier
    final cartNotifier = Provider.of<CartNotifier>(context, listen: false);
    final totalAmount = double.tryParse(cartNotifier.totalprice()) ?? 0.0;

    // Initialize UPI Details dynamically based on cart's total amount
    upiDetails = UPIDetails(
      upiID: "aaditya08072004@oksbi", // Your permanent UPI ID
      payeeName: "Aaditya Sharma",    // Your fixed payee name
      amount: totalAmount,            // Use the total amount from the cart
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Payment QR Code"),
      ),
      body: Center(
        child: UPIPaymentQRCode(
          upiDetails: upiDetails,
          size: 200, // Size of the QR code
        ),
      ),
    );
  }
}