// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Privacy Policy for Evira'),
            const SizedBox(height: 20),

            _buildSectionContent(
                'Welcome to Evira, your trusted ecommerce mobile application. At Evira, we prioritize the privacy and security of our users\' personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard your information when you use our mobile application and the services offered through it.'),
            const SizedBox(height: 20),

            _buildSectionTitle('1. Information We Collect'),
            _buildSectionContent(
                'When you use our App, we may collect various types of information from you, including:\n\n'
                '• Personal Information: Such as your name, email address, phone number, and billing address, which you provide to us when creating an account or making a purchase.\n'
                '• Payment Information: Details necessary for processing payments, such as credit card information.\n'
                '• Usage Information: Data about how you interact with our App, including pages visited, products viewed, and other actions taken within the App.\n'
                '• Device Information: Information about your mobile device, such as device type, operating system, and unique device identifiers.\n'
                '• Location Information: Your device\'s IP address or general location information if you enable location-based services.'),
            const SizedBox(height: 20),

            _buildSectionTitle('2. How We Use Your Information'),
            _buildSectionContent(
                'We use the information we collect for various purposes, including to:\n\n'
                '• Provide and maintain our App\'s functionality.\n'
                '• Process your transactions and orders.\n'
                '• Personalize your experience and improve our App\'s features.\n'
                '• Communicate with you, including sending you updates, promotions, and service-related notices.\n'
                '• Protect our legal rights and prevent misuse or unauthorized access to our App.'),
            const SizedBox(height: 20),

            _buildSectionTitle('3. Sharing Your Information'),
            _buildSectionContent(
                'We may share your information in the following circumstances:\n\n'
                '• With service providers who assist us in operating our App and providing services to you.\n'
                '• When required by law or to respond to legal process.\n'
                '• With your consent or at your direction.'),
            const SizedBox(height: 20),

            _buildSectionTitle('4. Security of Your Information'),
            _buildSectionContent(
                'We implement reasonable security measures to protect your information from unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the internet or electronic storage is completely secure.'),
            const SizedBox(height: 20),

            _buildSectionTitle('5. Your Choices'),
            _buildSectionContent(
                'You have choices regarding the collection, use, and sharing of your information:\n\n'
                '• You can access and update your personal information through your account settings in the App.\n'
                '• You may choose to opt-out of receiving promotional communications from us.'),
            const SizedBox(height: 20),

            _buildSectionTitle('6. Children\'s Privacy'),
            _buildSectionContent(
                'Our App is not intended for use by children under the age of 13. We do not knowingly collect personal information from children under 13. If you believe that we may have collected personal information from a child under 13, please contact us immediately.'),
            const SizedBox(height: 20),

            _buildSectionTitle('7. Changes to This Privacy Policy'),
            _buildSectionContent(
                'We may update this Privacy Policy periodically to reflect changes in our practices and legal requirements. We will notify you of any material changes by posting the updated Privacy Policy on our website or through other communication channels.'),
            const SizedBox(height: 20),

            _buildSectionTitle('8. Contact Us'),
            _buildSectionContent(
                'If you have any questions about this Privacy Policy or our data practices, please contact us at '),
            GestureDetector(
              onTap: () => _launchEmail('sudharshm2005@gmail.com'),
              child: const Text(
                'sudharshm2005@gmail.com',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: const TextStyle(
        fontSize: 16,
        height: 1.65, // This gives some space between lines for readability
      ),
    );
  }

  void _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Privacy%20Policy%20Inquiry&body=Hello', // add subject and body here
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }
}
