import 'package:flutter/material.dart';

import '../../constants/ui_helpers.dart';
import '../app_colors.dart';

/* -- Light & Dark Outlined Button Themes -- */
class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: dark,
      side: const BorderSide(color: borderPrimary),
      textStyle: const TextStyle(
          fontSize: fontSize16, color: black, fontWeight: FontWeight.w600),
      padding:
          const EdgeInsets.symmetric(vertical: buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: light,
      side: const BorderSide(color: borderPrimary),
      textStyle: const TextStyle(
          fontSize: 16, color: textWhite, fontWeight: FontWeight.w600),
      padding:
          const EdgeInsets.symmetric(vertical: buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius)),
    ),
  );
}
