// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app_flutter/main.dart';
import 'package:flutter/material.dart';//p Import your login page here
    import 'onboarding_widgets.dart'; // Import your onboarding widgets here

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
               const OnboardingPage(
                title: 'We provide high quality products just for you',
                image: 'assets/images/tharun2.jpg',
                isFullScreenImage: true,
              ),
              const OnboardingPage(
                title: 'Your satisfaction is our number one priority',
                image: 'assets/images/vasu.jpg',
                isFullScreenImage: true,
              ),
              const OnboardingPage(
                title: 'Let\'s fulfill your daily needs with Evira right now!',
                image: 'assets/images/sudharsh.jpg',
                isFullScreenImage: true,
              ),
            ],
          ),
          Positioned(
            bottom: 20.0,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _currentPage == 2 // Show button only on the last page (index 2)
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const MainScreen(), // Navigate to home page
                            ),
                          );
                        },
                        child: const Text('Let\'s go'),
                      )
                    : const SizedBox.shrink(), // Hide button on other pages
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      indicators.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 8.0,
      width: isActive ? 25.0 : 6.0,
      decoration: BoxDecoration(
        color: isActive ? const Color.fromARGB(255, 13, 13, 14) : Colors.grey,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
