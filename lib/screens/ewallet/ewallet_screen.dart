// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My E-Wallet'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 20),
            _buildTransactionHistoryHeader(),
            const SizedBox(height: 10),
            Expanded(child: _buildTransactionHistoryList()),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tharun Saro',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('**** **** **** 3629'),
                SizedBox(height: 10),
                Text(
                  'Your balance',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 5),
                Text(
                  '₹9,379',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle top up action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Top Up'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionHistoryHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Transaction History',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            // Handle see all action
          },
          child: const Text('See All'),
        ),
      ],
    );
  }

  Widget _buildTransactionHistoryList() {
    final transactions = [
      _buildTransactionItem('Suga Leather Shoes', 'Dec 15, 2024 | 10:00 AM', '₹262.5', 'assets/images/shoes/shoe1.png', 'Orders'),
      _buildTransactionItem('Top Up Wallet', 'Dec 14, 2024 | 10:42 PM', '₹500', 'assets/images/topup.png', 'Top Up'),
      _buildTransactionItem('Mini Leather Bag', 'Dec 14, 2024 | 14:46 PM', '₹540', 'assets/images/bags/bag1.png', 'Orders'),
      _buildTransactionItem('Top Up Wallet', 'Dec 12, 2024 | 09:27 AM', '₹550', 'assets/images/topup.png', 'Top Up'),
    ];

    return ListView.separated(
      itemCount: transactions.length,
      itemBuilder: (context, index) => transactions[index],
      separatorBuilder: (context, index) => const Divider(),
    );
  }

  Widget _buildTransactionItem(
      String title, String date, String amount, String image, String type) {
    return ListTile(
      leading: Image.asset(image, fit: BoxFit.cover, width: 40, height: 40),
      title: Text(title),
      subtitle: Text(date),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(type, style: TextStyle(color: type == 'Orders' ? Colors.red : Colors.green)),
        ],
      ),
    );
  }

}
