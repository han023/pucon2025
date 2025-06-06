// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_strings.dart';
import '../constants/ui_helpers.dart';

class text_helper extends StatelessWidget {
  text_helper(
      {super.key,
      required this.data,
      this.font = roboto,
      this.color,
      this.size = fontSize14,
      this.fontWeight = FontWeight.normal,
      this.textDecoration,
      this.textAlign = TextAlign.center});

  String data, font;
  Color? color;
  double? size;
  FontWeight fontWeight;
  TextAlign textAlign;

  TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style:
          customstyle(font, color, size, context, fontWeight, textDecoration),
      textAlign: textAlign,
    );
  }

  static TextStyle customstyle(
      String font,
      Color? color,
      double? size,
      BuildContext context,
      FontWeight fontWeight,
      TextDecoration? textDecoration) {
    if (font == sourceserif) {
      return TextStyle(
          fontFamily: "SourceSerifPro",
          color: color,
          decoration: textDecoration,
          fontSize: getResponsiveFontSize(context, fontSize: size) * 3,
          fontWeight: fontWeight);
    } else if (font == roboto) {
      return GoogleFonts.roboto(
          color: color,
          decoration: textDecoration,
          fontSize: getResponsiveFontSize(context, fontSize: size) * 3,
          fontWeight: fontWeight);
    } else {
      return GoogleFonts.roboto(
          color: color,
          decoration: textDecoration,
          fontSize: getResponsiveFontSize(context, fontSize: size) * 3,
          fontWeight: fontWeight);
    }
  }
}
