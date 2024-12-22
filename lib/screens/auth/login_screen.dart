// ignore_for_file: use_key_in_widget_constructors, use_super_parameters

import 'package:flutter/material.dart';
import 'signin_screen.dart';  // Import the sign-in screen
import 'signup_screen.dart';  // Import the sign-up screen

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 235, 235),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/first.png',
                height: 150,
              ),
              const SizedBox(height: 40),
              const Text(
                "Let's you in",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              SocialButton(
                text: 'Continue with Facebook',
                icon: Icons.facebook,
                color: const Color.fromARGB(255, 243, 242, 242),
                onPressed: () {},
              ),
              SocialButton(
                text: 'Continue with Google',
                icon: Icons.g_mobiledata_rounded,
                color: const Color.fromARGB(255, 243, 242, 242),
                onPressed: () {},
              ),
              SocialButton(
                text: 'Continue with Apple',
                icon: Icons.apple,
                color: const Color.fromARGB(255, 243, 242, 242),
                onPressed: () {},
              ),
              const SizedBox(height: 30),
              const Text('or', style: TextStyle(color: Color.fromARGB(255, 15, 14, 14))),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 8, 8, 8),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                child: const Text(
                  'Sign in with password',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: const Text("Don't have an account? Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const SocialButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        icon: Icon(icon, color: const Color.fromARGB(255, 59, 129, 209)),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 15),
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
