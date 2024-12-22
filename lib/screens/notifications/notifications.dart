import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          NotificationCard(
            icon: Icons.discount,
            title: '30% Special Discounts',
            subtitle: 'Get 30% off on your next purchase!',
          ),
          NotificationCard(
            icon: Icons.check_circle,
            title: 'Account Set Up Successfully',
            subtitle: 'Your account has been set up successfully.',
          ),
          NotificationCard(
            icon: Icons.account_balance_wallet,
            title: 'E-Wallet Top Up Successful',
            subtitle: 'Your e-wallet has been topped up successfully.',
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const NotificationCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
