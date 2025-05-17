import 'package:flutter/material.dart';
import 'package:pucon2025/ui/common/constants/app_strings.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/ui_helpers.dart';
import '../../../common/customwidget/text_helper.dart';

Widget loginOtherAuthButtons() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: padding16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: padding12, horizontal: padding12),
                side: const BorderSide(color: primary),
              ),
              child: text_helper(
                data: "Google",
                fontWeight: FontWeight.bold,
                font: sourceserif,
              )),
        ),
        horizontalSpaceMedium,
        Expanded(
          child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: padding12, horizontal: padding12),
                side: const BorderSide(color: primary),
              ),
              child: text_helper(
                  data: "FaceBook",
                  fontWeight: FontWeight.bold,
                  font: sourceserif)),
        )
      ],
    ),
  );
}
