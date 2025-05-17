import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pucon2025/ui/common/constants/app_strings.dart';
import 'package:pucon2025/ui/views/auth/signup/signup_bottom.dart';
import 'package:pucon2025/ui/views/auth/signup/signup_viewmodel.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/ui_helpers.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/customwidget/text_view_helper.dart';
import '../login/login_other_auth_buttons.dart';

Widget signupBeforeVerify(BuildContext context, SignupViewModel viewModel) {
  return Padding(
    padding: const EdgeInsets.all(padding10),
    child: Column(
      children: [
        Column(
          children: [
            text_view_helper(
                prefix: const Icon(Icons.person),
                hint: "Name",
                controller: viewModel.name)
                .animate(delay: 900.ms)
                .fade()
                .moveY(begin: 100, end: 0),
            text_view_helper(
              hint: "Email",
              controller: viewModel.email,
              prefix: const Icon(Icons.link),
            ).animate(delay: 1100.ms).fade().moveY(begin: 100, end: 0),
            text_view_helper(
              hint: "Enter Password",
              controller: viewModel.password,
              obsecure: viewModel.obsure,
              maxline: 1,
              suffix: InkWell(
                onTap: () => viewModel.toggle(),
                child:
                Icon(viewModel.obsure ? Iconsax.eye_slash : Iconsax.eye),
              ),
              prefix: const Icon(Icons.lock),
            ).animate(delay: 1300.ms).fade().moveY(begin: 100, end: 0),
            verticalSpaceSmall,
            button_helper(
                onpress: () => viewModel.signup(context),
                width: screenWidth(context),
                child: text_helper(
                  data: "Sign Up",
                  fontWeight: FontWeight.bold,
                  color: white,
                )).animate(delay: 1500.ms).fade().moveY(begin: 100, end: 0),
            verticalSpaceMedium,
            text_helper(
              data: "or connect",
              color: darkGrey,
              font: sourceserif,
            ).animate(delay: 1500.ms).fade().moveY(begin: 100, end: 0),
            verticalSpaceSmall,
            loginOtherAuthButtons()
                .animate(delay: 1700.ms)
                .fade()
                .moveY(begin: 100, end: 0)
          ],
        ),
        verticalSpaceMedium,
        signupBottom(context, viewModel),
      ],
    ),
  );
}
