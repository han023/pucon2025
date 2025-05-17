import 'package:flutter/material.dart';

import '../app_colors.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: getColorWithOpacity(grey, 0.4),
    labelStyle: const TextStyle(color: black),
    selectedColor: primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: darkerGrey,
    labelStyle: TextStyle(color: white),
    selectedColor: primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: white,
  );
}
