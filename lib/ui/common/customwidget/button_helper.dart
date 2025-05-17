// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/ui_helpers.dart';

class button_helper extends StatelessWidget {
  button_helper({
    super.key,
    required this.onpress,
    this.color,
    this.margin = const EdgeInsetsDirectional.symmetric(horizontal: padding8),
    this.width,
    required this.child,
  });
  Function onpress;
  final Color? color;
  EdgeInsetsDirectional margin;
  double? width;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onpress(),
      child: Container(
          width: width,
          margin: margin,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: primary,
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    color: grey.withOpacity(0.2),
                    spreadRadius: 5)
              ]),
          child: child),
    );
  }
}
