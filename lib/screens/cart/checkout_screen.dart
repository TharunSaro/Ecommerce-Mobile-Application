// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/cart_model.dart';
import '/screens/payment/payment_screen.dart';
import '/screens/profile/edit_address/edit_address_screen.dart'; // Import the edit address screen

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? selectedAddress;

  void _selectAddress() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddressEditScreen()),
    );

    if (result != null && result is String) {
      setState(() {
        selectedAddress = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Delivery Address', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            InkWell(
              onTap: _selectAddress,
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  selectedAddress ?? 'Tap to select an address',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Ordered Items', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
  child: ListView.builder(
    itemCount: cart.items.length,
    itemBuilder: (context, index) {
      final item = cart.items[index];
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(item.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('Color: ${item.color}'),
                    Text('Size: ${item.size}'),
                    Text('₹${item.price.toStringAsFixed(2)} x ${item.quantity}'),
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

            const SizedBox(height: 16),
            Text(
              'Total Price: ₹${cart.totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  PaymentScreen()),
                );// Navigate to the payment screen or handle payment logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Set the button color to black
                ),
                child: const Text('Continue to Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
