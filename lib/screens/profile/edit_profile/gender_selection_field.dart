// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class GenderSelectionField extends StatefulWidget {
  final String? selectedGender;
  final ValueChanged<String>? onChanged;

  const GenderSelectionField({
    super.key,
    this.selectedGender,
    this.onChanged,
  });

  @override
  _GenderSelectionFieldState createState() => _GenderSelectionFieldState();
}

class _GenderSelectionFieldState extends State<GenderSelectionField> {
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    _selectedGender = widget.selectedGender;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Radio<String>(
              value: 'Male',
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                  widget.onChanged?.call(value!);
                });
              },
            ),
            const Text('Male'),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: 'Female',
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                  widget.onChanged?.call(value!);
                });
              },
            ),
            const Text('Female'),
          ],
        ),
      ],
    );
  }
}
