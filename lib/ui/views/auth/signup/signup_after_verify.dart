import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pucon2025/ui/views/auth/signup/signup_viewmodel.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/helper_functions.dart';
import '../../../common/constants/ui_helpers.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/text_helper.dart';

Widget signupAfterVerify(BuildContext context, SignupViewModel viewModel) {
  return Column(
    children: [
      text_helper(
        data: "Verify Email",
        color: isDarkMode(context) ? grey : darkGrey,
      ).animate(delay: 300.ms).fade().moveY(begin: 100, end: 0),
      text_helper(
        data: "Please Verify your email and Login to continue",
        color: isDarkMode(context) ? grey : darkGrey,
      ).animate(delay: 500.ms).fade().moveY(begin: 100, end: 0),
      verticalSpaceMedium,
      button_helper(
          onpress: () => viewModel.login(),
          width: screenWidth(context),
          child: text_helper(
            data: "Click here to login",
            fontWeight: FontWeight.bold,
            color: white,
            size: fontSize16,
          )).animate(delay: 700.ms).fade().moveY(begin: 100, end: 0),
    ],
  );
}
