// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:ecommerce_app_flutter/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class CreatePasswordScreen extends StatefulWidget {
  @override
  _CreatePasswordScreenState createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _createPassword() {
    if (passwordController.text.isEmpty || confirmPasswordController.text.isEmpty) {
      _showDialog('Error', 'Please enter the new password.');
    } else if (passwordController.text == confirmPasswordController.text) {
      _showDialog('Success', 'Your password has been changed successfully.', navigateToHome: true);
    } else {
      _showDialog('Error', 'Passwords do not match. Please try again.');
    }
  }

  void _showDialog(String title, String content, {bool navigateToHome = false}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                if (navigateToHome) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  ); // Navigate to the home screen
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: confirmPasswordController,
              decoration: const InputDecoration(
                labelText: 'Confirm New Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _createPassword,
              child: const Text('Create Password'),
            ),
          ],
        ),
      ),
    );
  }
}
