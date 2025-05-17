import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pucon2025/ui/common/constants/app_strings.dart';
import 'package:pucon2025/ui/views/auth/login/login_viewmodel.dart';
import 'package:pucon2025/ui/views/auth/signup/signup_viewmodel.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/ui_helpers.dart';
import '../../../common/customwidget/text_helper.dart';

Widget signupBottom(BuildContext context, SignupViewModel viewModel){
  return Column(
    children: [
      InkWell(
          onTap: () => viewModel.login(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text_helper(
                data: "Have an account? ",
                size: fontSize12,
                color: darkGrey,
                font: sourceserif,
              ),
              text_helper(data: "Sign In", color: black, size: fontSize12),
            ],
          )),
      verticalSpaceSmall,
    ],
  ).animate(delay: 1900.ms).fade().moveY(begin: 100, end: 0);
}