import 'package:flutter/material.dart';

import '../../constants/ui_helpers.dart';
import '../app_colors.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: darkGrey,
    suffixIconColor: darkGrey,
    // constraints: const BoxConstraints.expand(height: inputFieldHeight),
    labelStyle:
        const TextStyle().copyWith(fontSize: fontSize16, color: darkGrey),
    hintStyle: const TextStyle().copyWith(fontSize: fontSize14, color: grey),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: darkGrey,
    suffixIconColor: darkGrey,
    // constraints: const BoxConstraints.expand(height: inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: fontSize16, color: grey),
    hintStyle:
        const TextStyle().copyWith(fontSize: fontSize14, color: darkGrey),
    floatingLabelStyle:
        const TextStyle().copyWith(color: white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: warning),
    ),
  );
}
