import 'package:flutter/cupertino.dart';

import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/app_strings.dart';
import '../../../../../common/constants/ui_helpers.dart';
import '../../../../../common/customwidget/text_helper.dart';

Widget HeadingBrowse(String title) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          text_helper(
            data: title,
            fontWeight: FontWeight.bold,
            font: sourceserif,
            size: fontSize16,
          ),
          text_helper(
            data: "See all>",
            size: fontSize10,
            color: primary,
            font: sourceserif,
          )
        ],
      ),
      verticalSpaceSmall,
    ],
  );
}
