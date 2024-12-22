// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String? _selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Suggested Section
          const Text(
            'Suggested',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          _buildLanguageItem('English (US)', 'en_US'),
          _buildLanguageItem('English (UK)', 'en_UK'),
          
          const SizedBox(height: 20),

          // Language Section
          const Text(
            'Language',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          _buildLanguageItem('Mandarin', 'zh'),
          _buildLanguageItem('Hindi', 'hi'),
          _buildLanguageItem('Spanish', 'es'),
          _buildLanguageItem('French', 'fr'),
          _buildLanguageItem('Arabic', 'ar'),
          _buildLanguageItem('Bengali', 'bn'),
          _buildLanguageItem('Russian', 'ru'),
          _buildLanguageItem('Indonesian', 'id'),
        ],
      ),
    );
  }

  Widget _buildLanguageItem(String language, String code) {
    return ListTile(
      title: Text(language),
      trailing: Radio<String>(
        value: code,
        groupValue: _selectedLanguage,
        onChanged: (String? value) {
          setState(() {
            _selectedLanguage = value;
            // TODO: Implement language selection functionality
          });
        },
      ),
    );
  }
}
