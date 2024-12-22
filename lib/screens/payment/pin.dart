// pin.dart
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'payment.dart';
import '../orders/my_orders_screen.dart';
import 'e_receipt.dart';

class PinScreen extends StatefulWidget {
  final PaymentMethod selectedMethod;

  const PinScreen({super.key, required this.selectedMethod});

  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  final String correctPin = '2004';
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  List<String> pinDigits = ['', '', '', ''];

  void _verifyPin() {
    if (pinDigits.join() == correctPin) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Order Successful!'),
            content: const Text('You have successfully made an order.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                   context,
                  MaterialPageRoute(builder: (context) => const MyOrdersScreen()),
                  );
                },
                child: const Text('View Order'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                   context,
                  MaterialPageRoute(builder: (context) => const EReceiptScreen()),
                  );
                },
                child: const Text('View E-Receipt'),
              ),
            ],
          );
        },
      );
    } else {
      // Show error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Incorrect PIN. Please try again.')),
      );
    }
  }

  Widget _buildPinBox(int index) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        // ignore: prefer_const_constructors
        style: TextStyle(fontSize: 24),
        keyboardType: TextInputType.number,
        maxLength: 1,
        obscureText: true,
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            pinDigits[index] = value;
            if (index < 3) {
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            } else {
              FocusScope.of(context).unfocus();
              _verifyPin();
            }
          } else {
            pinDigits[index] = '';
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your PIN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your PIN to confirm payment',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) => _buildPinBox(index)),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _verifyPin,
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
