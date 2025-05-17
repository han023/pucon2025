import 'package:flutter/material.dart';

// App theme colors
const Color primary = Color(0xFF1E59F5);
const Color primaryLight = Color(0xFF346BF3);
const Color secondary = Colors.pinkAccent;
const Color accent = Color(0xFFb0c7ff);

// Text colors
const Color textPrimary = Color(0xFF333333);
const Color textSecondary = Color(0xFF6C757D);
const Color textWhite = Colors.white;

// Background colors
const Color light = Color(0xFFF6F6F6);
const Color dark = Color(0xFF272727);
const Color primaryBackground = Color(0xFFF3F5FF);

// Background Container colors
const Color lightContainer = Color(0xFFF6F6F6);
Color darkContainer = white.withOpacity(0.1);

// Button colors
const Color buttonPrimary = Color(0xFF1E59F5);
const Color buttonSecondary = Color(0xFF6C757D);
const Color buttonDisabled = Color(0xFFC4C4C4);

// Border colors
const Color borderPrimary = Color(0xFFD9D9D9);
const Color borderSecondary = Color(0xFFE6E6E6);

// Error and validation colors
const Color error = Color(0xFF9F0E0E);
const Color success = Color(0xFF388E3C);
const Color warning = Color(0xFFF57C00);
const Color info = Color(0xFF1976D2);

// Neutral Shades
const Color black = Color(0xFF232323);
const Color darkerGrey = Color(0xFF4F4F4F);
const Color darkGrey = Color(0xFF939393);
const Color grey = Color(0xFFC3C3C3);
const Color softGrey = Color(0xFFF4F4F4);
const Color lightGrey = Color(0xFFF9F9F9);
const Color white = Color(0xFFFFFFFF);

Color getColorWithOpacity(Color colors, double val) {
  return colors.withOpacity(val);
}
