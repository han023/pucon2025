import 'package:flutter/material.dart';

import '../../constants/ui_helpers.dart';
import '../app_colors.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: black, size: icon16),
    actionsIconTheme: IconThemeData(color: black, size: icon16),
    titleTextStyle:
        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: black),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: black, size: icon16),
    actionsIconTheme: IconThemeData(color: white, size: icon16),
    titleTextStyle:
        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: white),
  );
}
