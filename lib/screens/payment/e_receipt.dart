import 'package:flutter/material.dart';

class EReceiptScreen extends StatelessWidget {
  const EReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Receipt'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/barcode.png', // Add the path to your barcode image here
                    width: 200,
                    height: 100,
                  ),
                  const SizedBox(height: 8),
                  const Text('273825            837279'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/shoes/shoe1.png', // Add the path to your product image here
                      width: 60,
                      height: 60,
                    ),
                    const SizedBox(width: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Suga Leather Shoes',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text('Qty: 1'),
                        Text('Color: Black'),
                        Text('Size: 40'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildReceiptDetail('Amount', '₹375.00'),
            _buildReceiptDetail('Promo', '-₹112.50'),
            const Divider(),
            _buildReceiptDetail('Total', '₹262.50'),
            const SizedBox(height: 16),
            _buildReceiptDetail('Payment Methods', 'My E-Wallet'),
            _buildReceiptDetail('Date', 'Dec 15, 2024 | 10:00:27 AM'),
            _buildReceiptDetail('Transaction ID', 'SK7263727399'),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Chip(
                  label: Text('Paid'),
                  backgroundColor: Colors.green,
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Category',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            DropdownButton<String>(
              value: 'Orders',
              items: <String>['Orders', 'Returns', 'Exchanges']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle category change
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiptDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
