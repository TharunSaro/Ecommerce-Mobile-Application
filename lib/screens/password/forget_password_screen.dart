// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'verification_screen.dart';  // Import the VerificationScreen

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/forgot.png', // Add an appropriate image asset here
              height: 200,
            ),
            const SizedBox(height: 16),
            const Text(
              'Select which contact details should we use to reset your password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: const Icon(Icons.sms),
                title: const Text('via SMS: +1 111 *****99'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerificationScreen(method: 'SMS', contact: '+1 111 *****99'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: const Icon(Icons.email),
                title: const Text('via Email: and***ley@yourdomain.com'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerificationScreen(method: 'Email', contact: 'and***ley@yourdomain.com'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
