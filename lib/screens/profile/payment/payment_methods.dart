// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  List<PaymentMethod> paymentMethods = [
    PaymentMethod(name: 'PayPal', iconPath: 'assets/images/payment_icons/paypal.png'),
    PaymentMethod(name: 'Google Pay', iconPath: 'assets/images/payment_icons/google_pay.png'),
    PaymentMethod(name: 'Apple Pay', iconPath: 'assets/images/payment_icons/apple_pay.png'),
    PaymentMethod(name: 'Credit Card', iconPath: 'assets/images/payment_icons/master_card.png', cardNumber: 'XXXX XXXX XXXX XXXX'),
  ];

  // Store selected method and connected status
  PaymentMethod? selectedMethod;

  // Dummy function to simulate payment method details input
  void _fillPaymentDetails(PaymentMethod method) async {
    // Simulate a form for entering payment details
    bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Fill Details for ${method.name}'),
          content: Text('Here, you would normally fill in details for ${method.name}.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cancel
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Confirm
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      setState(() {
        method.isConnected = true;
      });
    }
  }

  // Remove a payment method
  void _removePaymentMethod(PaymentMethod method) {
    setState(() {
      method.isConnected = false;
    });
  }

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
                      trailing: method.isConnected
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Connected',
                                  style: TextStyle(color: Colors.green,fontSize:12,fontWeight: FontWeight.bold ),
                                ),
                                const SizedBox(width: 8.0),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    _removePaymentMethod(method);
                                  },
                                ),
                              ],
                            )
                          : Radio<PaymentMethod>(
                              value: method,
                              groupValue: selectedMethod,
                              onChanged: (PaymentMethod? value) {
                                setState(() {
                                  selectedMethod = value;
                                });
                                _fillPaymentDetails(value!);
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
              onPressed: () {
                // Implement the logic to add a new payment method here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Add New Card',
                  style: TextStyle(fontSize: 16.0,color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}

class PaymentMethod {
  final String name;
  final String iconPath;
  final String? cardNumber;
  bool isConnected;

  PaymentMethod({
    required this.name,
    required this.iconPath,
    this.cardNumber,
    this.isConnected = false,
  });
}