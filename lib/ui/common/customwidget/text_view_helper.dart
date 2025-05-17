// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_strings.dart';
import '../constants/ui_helpers.dart';
import './text_helper.dart';

class text_view_helper extends StatelessWidget {
  text_view_helper({
    super.key,
    required this.hint,
    required this.controller,
    this.textstyle = poppins,
    this.hintcol,
    this.textcolor,
    this.size = fontSize14,
    this.fontWeight = FontWeight.w500,
    this.obsecure = false,
    this.textInputType = TextInputType.text,
    this.maxline,
    this.maxlength,
    this.padding = const EdgeInsetsDirectional.all(padding8),
    this.prefix,
    this.suffix,
    this.onchange,
    this.onsubmit,
    this.formatter = const [],
  });
  String hint, textstyle;
  Color? hintcol, textcolor;
  double size;
  bool obsecure;
  FontWeight fontWeight;
  int? maxline, maxlength;
  TextInputType textInputType;
  TextEditingController controller;
  EdgeInsetsDirectional padding;
  final Function(String)? onchange;
  final Function(String)? onsubmit;
  List<TextInputFormatter> formatter;
  Widget? prefix, suffix;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding,
        child: TextFormField(
          controller: controller,
          keyboardType: textInputType,
          decoration: InputDecoration(
              counterText: "",
              hintStyle: text_helper.customstyle(
                  textstyle, hintcol, size, context, FontWeight.normal, null),
              hintText: hint,
              prefixIcon: prefix,
              suffix: suffix),
          inputFormatters: formatter,
          obscureText: obsecure,
          maxLines: maxline,
          maxLength: maxlength,
          onFieldSubmitted:
              onsubmit != null ? (value) => onsubmit!(value) : null,
          onChanged: onchange != null ? (value) => onchange!(value) : null,
          style: text_helper.customstyle(
              textstyle, textcolor, size, context, fontWeight, null),
        ));
  }
}
