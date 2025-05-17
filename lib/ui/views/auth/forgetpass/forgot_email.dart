import 'package:flutter/cupertino.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_strings.dart';
import '../../../common/constants/ui_helpers.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/customwidget/text_view_helper.dart';
import 'forgetpass_viewmodel.dart';

Widget forgotEmail(BuildContext context, ForgetpassViewModel viewModel) {
  return Column(
    children: [
      Container(
        width: screenWidth(context),
        height: 2,
        color: lightGrey,
      ),
      Row(
        children: [
          text_helper(
            data: "Email",
            font: sourceserif,
          ),
          horizontalSpaceSmall,
          Expanded(
              child: text_view_helper(
                  padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
                  hint: "Enter your email",
                  showborder: false,
                  controller: viewModel.email)),
        ],
      ),
      Container(
        width: screenWidth(context),
        height: 2,
        color: lightGrey,
      ),
    ],
  );
}
