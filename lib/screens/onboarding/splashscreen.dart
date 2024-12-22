// splashscreen.dart

// ignore_for_file: library_private_types_in_public_api

import 'package:ecommerce_app_flutter/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate a 2-second delay before removing loader
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false; // Set loading to false after 2 seconds
      });
      // Navigate to LoginScreen after delay
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/logo.png'),
            const SizedBox(height: 100.0),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _isLoading
                  ? const CircularProgressIndicator() // Loader shown for 2 seconds
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
