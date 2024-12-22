// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SecurityScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SecurityScreenState createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool isRememberMeEnabled = false;
  bool isFaceIDEnabled = false;
  bool isBiometricIDEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security'),
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
          children: [
            _buildToggleSwitch(
              context,
              'Remember me',
              isRememberMeEnabled,
              (bool value) {
                setState(() {
                  isRememberMeEnabled = value;
                });
              },
            ),
            const Divider(thickness: 0.5,),
            _buildToggleSwitch(
              context,
              'Face ID',
              isFaceIDEnabled,
              (bool value) {
                setState(() {
                  isFaceIDEnabled = value;
                });
              },
            ),
            const Divider(thickness: 0.5,),
            _buildToggleSwitch(
              context,
              'Biometric ID',
              isBiometricIDEnabled,
              (bool value) {
                setState(() {
                  isBiometricIDEnabled = value;
                });
              },
            ),
            const Divider(thickness: 0.5,),
            ListTile(
              title: const Text('Google Authenticator'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Handle navigation to Google Authenticator setup
              },
            ),
            const Divider(thickness: 0.5,),
            const SizedBox(height: 24),
            _buildActionButton(context, 'Change PIN', () {
              // Handle Change PIN action
            }),
            const SizedBox(height: 16),
            _buildActionButton(context, 'Change Password', () {
              // Handle Change Password action
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleSwitch(BuildContext context, String title, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, backgroundColor: Colors.grey[300], // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20.0),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
