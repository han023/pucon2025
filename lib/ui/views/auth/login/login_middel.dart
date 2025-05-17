import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pucon2025/ui/views/auth/login/login_viewmodel.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_strings.dart';
import '../../../common/constants/ui_helpers.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/customwidget/text_view_helper.dart';
import 'login_other_auth_buttons.dart';

Widget loginMiddel(BuildContext context, LoginViewModel viewModel){
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          text_view_helper(
            hint: "abc@gmail.com",
            controller: viewModel.email,
            prefix: const Icon(Icons.person),
          ).animate(delay: 700.ms).fade().moveY(begin: 100, end: 0),
          text_view_helper(
            hint: "123@Abcd",
            controller: viewModel.password,
            obsecure: viewModel.obsure,
            maxline: 1,
            suffix: InkWell(
              onTap: () => viewModel.toggle(),
              child: Icon(
                  viewModel.obsure ? Iconsax.eye_slash : Iconsax.eye),
            ),
            prefix: const Icon(Icons.lock),
          ).animate(delay: 900.ms).fade().moveY(begin: 100, end: 0),
          verticalSpaceTiny,
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                  onTap: () => viewModel.forgotpassword(context),
                  child: text_helper(
                    data: "Forgot Password?",
                    size: fontSize12,
                    font: sourceserif,
                  )),
            ),
          ).animate(delay: 1100.ms).fade().moveY(begin: 100, end: 0),
          verticalSpaceMedium,
          button_helper(
              onpress: () => viewModel.login(context),
              width: screenWidth(context),
              child: text_helper(
                data: "Sign In",
                fontWeight: FontWeight.bold,
                color: white,
              ))
              .animate(delay: 1300.ms)
              .fade()
              .moveY(begin: 100, end: 0),
          verticalSpaceSmall,
          text_helper(
            data: "or connect",
            color: darkGrey,
          ).animate(delay: 1500.ms).fade().moveY(begin: 100, end: 0),
          verticalSpaceSmall,
          loginOtherAuthButtons().animate(delay: 1700.ms).fade().moveY(begin: 100, end: 0)
        ],
      ),
    ),
  );
}