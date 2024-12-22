import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool obscureText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final EdgeInsetsGeometry? padding;

  const AppTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.leadingIcon,
    this.trailingIcon,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          if (leadingIcon != null) leadingIcon!,
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
              ),
            ),
          ),
          if (trailingIcon != null) trailingIcon!,
        ],
      ),
    );
  }
}
