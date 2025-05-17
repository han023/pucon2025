import 'package:flutter/material.dart';

import '../app_colors.dart';

/// Custom Class for Light & Dark Text Themes
class TTextTheme {
  TTextTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle()
        .copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: dark),
    headlineMedium: const TextStyle()
        .copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: dark),
    headlineSmall: const TextStyle()
        .copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: dark),
    titleLarge: const TextStyle()
        .copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: dark),
    titleMedium: const TextStyle()
        .copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: dark),
    titleSmall: const TextStyle()
        .copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: dark),
    bodyLarge: const TextStyle()
        .copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: dark),
    bodyMedium: const TextStyle()
        .copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: dark),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: dark.withOpacity(0.5)),
    labelLarge: const TextStyle()
        .copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: dark),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: dark.withOpacity(0.5)),
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle()
        .copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: light),
    headlineMedium: const TextStyle()
        .copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: light),
    headlineSmall: const TextStyle()
        .copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: light),
    titleLarge: const TextStyle()
        .copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: light),
    titleMedium: const TextStyle()
        .copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: light),
    titleSmall: const TextStyle()
        .copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: light),
    bodyLarge: const TextStyle()
        .copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: light),
    bodyMedium: const TextStyle()
        .copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: light),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: light.withOpacity(0.5)),
    labelLarge: const TextStyle()
        .copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: light),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: light.withOpacity(0.5)),
  );
}
