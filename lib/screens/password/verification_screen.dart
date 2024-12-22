// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, library_private_types_in_public_api

import 'dart:async';
import 'package:ecommerce_app_flutter/screens/password/create_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for FilteringTextInputFormatter

class VerificationScreen extends StatefulWidget {
  final String method;
  final String contact;

  VerificationScreen({required this.method, required this.contact});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController codeController1 = TextEditingController();
  TextEditingController codeController2 = TextEditingController();
  TextEditingController codeController3 = TextEditingController();
  TextEditingController codeController4 = TextEditingController();
  int _counter = 60;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    codeController1.dispose();
    codeController2.dispose();
    codeController3.dispose();
    codeController4.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
          _showTimeoutDialog();
        }
      });
    });
  }

  void _showTimeoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Timed Out'),
          content: const Text('Your session has timed out. Please try again.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Go back to the OTP selection screen
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _verifyCode() {
    String code = codeController1.text + codeController2.text + codeController3.text + codeController4.text;
    if (code.length == 4) {
      // Add your code verification logic here
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreatePasswordScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid 4-digit code')),
      );
    }
  }

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
            Text(
              'Code has been sent to ${widget.contact}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCodeInput(codeController1),
                const SizedBox(width: 8),
                _buildCodeInput(codeController2),
                const SizedBox(width: 8),
                _buildCodeInput(codeController3),
                const SizedBox(width: 8),
                _buildCodeInput(codeController4),
              ],
            ),
            const SizedBox(height: 16),
            Text('Resend code in $_counter s'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _verifyCode,
              child: const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeInput(TextEditingController controller) {
    return SizedBox(
      width: 40,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ], // Ensures only digits can be entered
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: "",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
