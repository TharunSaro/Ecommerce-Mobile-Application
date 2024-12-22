// payment_screen.dart
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'payment.dart'; // Add this line
import 'pin.dart'; // Import the pin entry screen

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<PaymentMethod> paymentMethods = [
    PaymentMethod(name: 'E-Wallet', iconPath: 'assets/images/topup.png', isConnected: true),
    PaymentMethod(name: 'PayPal', iconPath: 'assets/images/payment_icons/paypal.png', isConnected: true),
    PaymentMethod(name: 'Google Pay', iconPath: 'assets/images/payment_icons/google_pay.png', isConnected: true),
    PaymentMethod(name: 'Apple Pay', iconPath: 'assets/images/payment_icons/apple_pay.png', isConnected: true),
    PaymentMethod(name: 'Credit Card', iconPath: 'assets/images/payment_icons/master_card.png', cardNumber: 'XXXX XXXX XXXX XXXX', isConnected: true),
  ];

  PaymentMethod? selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: paymentMethods.length,
              itemBuilder: (context, index) {
                final method = paymentMethods[index];
                if (!method.isConnected) return SizedBox.shrink(); // Show only connected cards
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        method.iconPath,
                        width: 40.0,
                        height: 40.0,
                      ),
                      title: Text(method.name),
                      subtitle: method.cardNumber != null
                          ? Text(method.cardNumber!)
                          : null,
                      trailing: Radio<PaymentMethod>(
                        value: method,
                        groupValue: selectedMethod,
                        onChanged: (PaymentMethod? value) {
                          setState(() {
                            selectedMethod = value;
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: selectedMethod != null
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PinScreen(selectedMethod: selectedMethod!)),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Confirm Payment',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
