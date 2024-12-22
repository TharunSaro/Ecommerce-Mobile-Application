// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../../common/app_text_field.dart';
import 'app_phone_number_field.dart';
import 'gender_selection_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AppTextField(
              hintText: 'Name',
              controller: _nameController,
              leadingIcon: const Icon(Icons.person),
            ),
            const SizedBox(height: 16),
            AppTextField(
              hintText: 'Date of Birth',
              controller: _dobController,
              //leadingIcon: Icon(Icons.calendar_today),
              trailingIcon: const Icon(Icons.calendar_today),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 16),
            AppTextField(
              hintText: 'Email',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              leadingIcon: const Icon(Icons.email),
            ),
            const SizedBox(height: 16),
            AppTextField(
              hintText: 'Country',
              controller: _countryController,
              leadingIcon: const Icon(Icons.location_on),
            ),
            const SizedBox(height: 16),
            AppPhoneNumberField(
              controller: _phoneController,
              initialCountryCode: '+1',
              onChanged: (value) {
              },
            ),
            const SizedBox(height: 16),
            GenderSelectionField(
              selectedGender: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                });
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Implement the update logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 80.0),
                child: Text('Update', style: TextStyle(fontSize: 18.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
