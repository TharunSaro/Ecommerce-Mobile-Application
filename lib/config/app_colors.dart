import 'package:flutter/material.dart';

/// A utility class that holds the app's color palette.
/// It defines colors used throughout the app to ensure consistency.
class AppColors {
  // Primary Colors
  static const Color primaryColor = Color(0xFF6C63FF); // Main theme color
  static const Color primaryLightColor = Color(0xFF9E99FF); // Light variant of the primary color
  static const Color primaryDarkColor = Color(0xFF3B34B4); // Dark variant of the primary color

  // Secondary Colors
  static const Color secondaryColor = Color(0xFFFE6B8B); // Accent color for highlights
  static const Color secondaryLightColor = Color(0xFFFF9DB4); // Light variant of the secondary color
  static const Color secondaryDarkColor = Color(0xFFC43D61); // Dark variant of the secondary color

  // Neutral Colors
  static const Color backgroundColor = Color(0xFFFFFFFF); // Background color for light theme
  static const Color backgroundDarkColor = Color(0xFF121212); // Background color for dark theme
  static const Color surfaceColor = Color(0xFFF5F5F5); // Surface color for light theme
  static const Color surfaceDarkColor = Color(0xFF333333); // Surface color for dark theme
  static const Color dividerColor = Color(0xFFE0E0E0); // Color for dividers and lines

  // Text Colors
  static const Color textColorPrimary = Color(0xFF212121); // Main text color for light theme
  static const Color textColorSecondary = Color(0xFF757575); // Secondary text color for light theme
  static const Color textColorDarkPrimary = Color(0xFFFFFFFF); // Main text color for dark theme
  static const Color textColorDarkSecondary = Color(0xFFBDBDBD); // Secondary text color for dark theme

  // Button Colors
  static const Color buttonColor = Color(0xFF6C63FF); // Default button color
  static const Color buttonTextColor = Color(0xFFFFFFFF); // Text color for buttons

  // Error Colors
  static const Color errorColor = Color(0xFFD32F2F); // Error message and indication color
  static const Color errorLightColor = Color(0xFFEF9A9A); // Light variant of the error color
  static const Color errorDarkColor = Color(0xFFC62828); // Dark variant of the error color

  // Other Colors
  static const Color successColor = Color(0xFF4CAF50); // Success message and indication color
  static const Color infoColor = Color(0xFF2196F3); // Information message and indication color
  static const Color warningColor = Color(0xFFFFC107); // Warning message and indication color

  // Transparent Colors
  static const Color transparent = Colors.transparent; // Transparent color

  static const ColorScheme lightColorScheme =  ColorScheme(
    primary: primaryColor,
    primaryContainer: primaryLightColor,
    secondary: secondaryColor,
    secondaryContainer: secondaryLightColor,
    surface: surfaceColor,
    surfaceBright: backgroundColor,
    error: errorColor,
    onPrimary: textColorDarkPrimary,
    onSecondary: textColorPrimary,
    onSurface: textColorPrimary,
    onSurfaceVariant: textColorPrimary,
    onError: buttonTextColor,
    brightness: Brightness.light,
  );

  /// Creates a color scheme for the dark theme.
  static const ColorScheme darkColorScheme = ColorScheme(
    primary: primaryDarkColor,
    primaryContainer: primaryColor,
    secondary: secondaryDarkColor,
    secondaryContainer: secondaryColor,
    surface: surfaceDarkColor,
    surfaceBright: backgroundDarkColor,
    error: errorDarkColor,
    onPrimary: textColorPrimary,
    onSecondary: textColorDarkPrimary,
    onSurface: textColorDarkPrimary,
    surfaceContainer: textColorDarkPrimary,
    onError: buttonTextColor,
    brightness: Brightness.dark,
  );
}
