// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import '../../common/app_button.dart';
import 'contact_us.dart';

class FAQScreen extends StatefulWidget {
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final Map<String, bool> _expandedSections = {};

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Help Center'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'FAQ'),
              Tab(text: 'Contact Us'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildFAQTab(),
            const ContactUsScreen(),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategoryTabs(),
          _buildSearchField(),
          _buildFAQItems(),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Row(
      children: [
        RoundedCornerButton(
          text: 'General',
          onPressed: () {},
          isSelected: true,
        ),
        const SizedBox(width: 8),
        RoundedCornerButton(
          text: 'Account',
          onPressed: () {},
        ),
        const SizedBox(width: 8),
        RoundedCornerButton(
          text: 'Service',
          onPressed: () {},
        ),
        const SizedBox(width: 8),
        RoundedCornerButton(
          text: 'Payment',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildSearchField() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildFAQItems() {
    List<Map<String, String>> faqs = [
      {
        'question': 'What is Evira?',
        'answer': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...'
      },
      {
        'question': 'How do I create an Evira account?',
        'answer': 'To create an Evira account, download the app, open it, and click on the "Sign Up" or "Create Account" button. Follow the prompts to enter your details and set up your account.'
    },
    {
        'question': 'How can I update my profile information?',
        'answer': 'To update your profile information in Evira, go to the "Profile" or "Account Settings" section within the app. You can edit your details such as name, email address, and profile picture there.'
    },
    {
        'question': 'Is Evira available on multiple platforms?',
        'answer': 'Evira is currently available on iOS and Android platforms. You can download it from the App Store for iOS devices and Google Play Store for Android devices.'
    },
    {
        'question': 'How often is Evira updated?',
        'answer': 'We strive to update Evira regularly to improve performance, add new features, and fix any issues. Updates are typically released every few weeks.'
    },
    {
        'question': 'What features does Evira offer?',
        'answer': 'Evira offers a variety of features such as task management, goal tracking, collaboration tools, and analytics to help you stay productive and organized.'
    },
    {
        'question': 'Can I use Evira offline?',
        'answer': 'Evira offers limited offline functionality. Some features may be accessible offline, but full functionality requires an internet connection.'
    },
    {
        'question': 'How can I upgrade to a premium subscription?',
        'answer': 'To upgrade to a premium subscription in Evira, go to the "Subscription" or "Upgrade" section within the app. Follow the prompts to choose a subscription plan and complete the payment.'
    },
    {
        'question': 'What payment methods does Evira accept?',
        'answer': 'Evira accepts major credit cards (Visa, MasterCard, American Express) and payment methods like PayPal for premium subscriptions and in-app purchases.'
    }// Add more FAQ items here
    ];

    return Column(
      children: faqs.map((faq) {
        bool isExpanded = _expandedSections[faq['question']] ?? false;
        return ExpansionPanelList(
          elevation: 1,
          expandedHeaderPadding: const EdgeInsets.all(0),
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _expandedSections[faq['question']!] = !isExpanded;
            });
          },
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(faq['question']!),
                );
              },
              body: ListTile(
                title: Text(faq['answer']!),
              ),
              isExpanded: isExpanded,
            ),
          ],
        );
      }).toList(),
    );
  }
}
