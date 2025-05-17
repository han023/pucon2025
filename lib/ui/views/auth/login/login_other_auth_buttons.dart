import 'package:flutter/material.dart';

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
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                side: const BorderSide(color: primary),
              ),
              child: text_helper(data: "Google")),
        ),
        horizontalSpaceMedium,
        Expanded(
          child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                side: const BorderSide(color: primary),
              ),
              child: text_helper(data: "FaceBook")),
        )
      ],
    ),
  );
}
