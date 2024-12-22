import 'package:flutter/material.dart';
import 'CustomerService_screen.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContactOption(
            iconPath: 'lib/assets/images/invite/headset_mic.png',
            title: 'Customer Service',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CustomerServiceChatScreen()),
              );
            },
          ),
          _buildContactOption(
            iconPath: 'lib/assets/images/invite/whatsapp.png',
            title: 'WhatsApp',
            onPressed: () {
              // Implement WhatsApp integration here
            },
          ),
          _buildContactOption(
            iconPath: 'lib/assets/images/invite/web.png',
            title: 'Website',
            onPressed: () {
              // Implement Website navigation here
            },
          ),
          _buildContactOption(
            iconPath: 'lib/assets/images/invite/facebook.png',
            title: 'Facebook',
            onPressed: () {
              // Implement Facebook navigation here
            },
          ),
          _buildContactOption(
            iconPath: 'lib/assets/images/invite/X.png',
            title: 'X',
            onPressed: () {
              // Implement Twitter navigation here
            },
          ),
          _buildContactOption(
            iconPath: 'lib/assets/images/invite/instagram.png',
            title: 'Instagram',
            onPressed: () {
              // Implement Instagram navigation here
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContactOption({
    required String iconPath,
    required String title,
    required VoidCallback onPressed,
  }) {
    return ListTile(
      leading: CircularButton(
        icon: iconPath,
        onPressed: onPressed,
        size: 40.0,
      ),
      title: Text(title),
      onTap: onPressed,
    );
  }
}

class CircularButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double? size;

  const CircularButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        shape: const CircleBorder(),
        padding: EdgeInsets.all(size ?? 20.0),
      ),
      child: Image.asset(
        icon,
        width: size ?? 24.0,
        height: size ?? 24.0,
      ),
    );
  }
}
