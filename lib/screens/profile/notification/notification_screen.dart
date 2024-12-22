import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Notification settings state
  bool generalNotification = true;
  bool sound = true;
  bool vibrate = false;
  bool specialOffers = true;
  bool promoAndDiscount = false;
  bool payments = true;
  bool cashback = false;
  bool appUpdates = true;
  bool newServiceAvailable = false;
  bool newTipsAvailable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Go back to the previous screen
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSwitchTile(
            title: 'General Notification',
            value: generalNotification,
            onChanged: (value) {
              setState(() {
                generalNotification = value;
              });
            },
          ),
          _buildDivider(),
          _buildSwitchTile(
            title: 'Sound',
            value: sound,
            onChanged: (value) {
              setState(() {
                sound = value;
              });
            },
          ),
          _buildDivider(),
          _buildSwitchTile(
            title: 'Vibrate',
            value: vibrate,
            onChanged: (value) {
              setState(() {
                vibrate = value;
              });
            },
          ),
          _buildDivider(),
          _buildSwitchTile(
            title: 'Special Offers',
            value: specialOffers,
            onChanged: (value) {
              setState(() {
                specialOffers = value;
              });
            },
          ),
          _buildDivider(),
          _buildSwitchTile(
            title: 'Promo & Discount',
            value: promoAndDiscount,
            onChanged: (value) {
              setState(() {
                promoAndDiscount = value;
              });
            },
          ),
          _buildDivider(),
          _buildSwitchTile(
            title: 'Payments',
            value: payments,
            onChanged: (value) {
              setState(() {
                payments = value;
              });
            },
          ),
          _buildDivider(),
          _buildSwitchTile(
            title: 'Cashback',
            value: cashback,
            onChanged: (value) {
              setState(() {
                cashback = value;
              });
            },
          ),
          _buildDivider(),
          _buildSwitchTile(
            title: 'App Updates',
            value: appUpdates,
            onChanged: (value) {
              setState(() {
                appUpdates = value;
              });
            },
          ),
          _buildDivider(),
          _buildSwitchTile(
            title: 'New Service Available',
            value: newServiceAvailable,
            onChanged: (value) {
              setState(() {
                newServiceAvailable = value;
              });
            },
          ),
          _buildDivider(),
          _buildSwitchTile(
            title: 'New Tips Available',
            value: newTipsAvailable,
            onChanged: (value) {
              setState(() {
                newTipsAvailable = value;
              });
            },
          ),
        ],
      ),
    );
  }

  // Helper function to build a switch list tile
  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
      ),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.black,
    );
  }

  // Helper function to build a divider
  Widget _buildDivider() {
    return Divider(
      thickness: 1.0,
      color: Colors.grey[300],
      height: 1.0,
    );
  }
}
