import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.borderRadius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        ),
        padding: padding ?? const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: fontSize ?? 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? size;

  const CircularButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        shape: const CircleBorder(),
        padding: EdgeInsets.all(size ?? 20.0),
      ),
      child: Icon(
        icon,
        color: iconColor ?? Colors.white,
        size: size ?? 24.0,
      ),
    );
  }
}

class RoundedCornerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final bool? isSelected;

  const RoundedCornerButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.padding,
    this.borderRadius,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor ?? Theme.of(context).primaryColor, backgroundColor: isSelected! ? (backgroundColor ?? Theme.of(context).primaryColor) : Colors.transparent,
        side: BorderSide(color: backgroundColor ?? Theme.of(context).primaryColor, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 20.0),
        ),
        padding: padding ?? const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected! ? (textColor ?? Colors.white) : backgroundColor ?? Theme.of(context).primaryColor,
          fontSize: fontSize ?? 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
