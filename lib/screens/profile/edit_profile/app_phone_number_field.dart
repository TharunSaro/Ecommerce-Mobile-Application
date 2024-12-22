// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'country_codes.dart';

class AppPhoneNumberField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String initialCountryCode;

  const AppPhoneNumberField({
    super.key,
    required this.controller,
    this.onChanged,
    this.initialCountryCode = '+1',
  });

  @override
  _AppPhoneNumberFieldState createState() => _AppPhoneNumberFieldState();
}

class _AppPhoneNumberFieldState extends State<AppPhoneNumberField> {
  String? _selectedCountryCode;

  @override
  void initState() {
    super.initState();
    _selectedCountryCode = widget.initialCountryCode;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          DropdownButton<String>(
            value: _selectedCountryCode,
            items: countries.map((Country country) {
              return DropdownMenuItem<String>(
                value: country.code,
                child: Row(
                  children: [
                    Text(country.code),
                    const SizedBox(width: 8.0),
                    Text(country.name),
                  ],
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedCountryCode = newValue!;
                widget.onChanged?.call(_selectedCountryCode! + widget.controller.text);
              });
            },
            underline: const SizedBox(), // Remove the default underline
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              controller: widget.controller,
              keyboardType: TextInputType.phone,
              onChanged: (String newValue) {
                widget.onChanged?.call(_selectedCountryCode! + newValue);
              },
              decoration: const InputDecoration(
                hintText: 'Enter phone number',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
