import 'package:flutter/material.dart';

import '../../constants/ui_helpers.dart';
import '../app_colors.dart';

/* -- Light & Dark Elevated Button Themes -- */
class TElevatedButtonTheme {
  TElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: light,
      backgroundColor: primary,
      disabledForegroundColor: darkGrey,
      disabledBackgroundColor: buttonDisabled,
      // side: const BorderSide(color: primary),
      padding: const EdgeInsets.all(padding8),
      textStyle: const TextStyle(
          fontSize: 16, color: textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: light,
      backgroundColor: primary,
      disabledForegroundColor: darkGrey,
      disabledBackgroundColor: darkerGrey,
      // side: const BorderSide(color: primary),
      padding: const EdgeInsets.all(padding8),
      textStyle: const TextStyle(
          fontSize: 16, color: textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius)),
    ),
  );
}
