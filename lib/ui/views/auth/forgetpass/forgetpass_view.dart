import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stacked/stacked.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_strings.dart';
import '../../../common/constants/ui_helpers.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/customwidget/text_view_helper.dart';
import 'forgetpass_viewmodel.dart';

class ForgetpassView extends StackedView<ForgetpassViewModel> {
  const ForgetpassView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ForgetpassViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              text_helper(
                data: "Forget Password",
                fontWeight: FontWeight.bold,
                size: fontSize20,
              ).animate(delay: 500.ms).fade().moveY(begin: 100, end: 0),
              text_helper(
                data: "Please enter email to recover your password.",
                textAlign: TextAlign.start,
              ).animate(delay: 700.ms).fade().moveY(begin: 100, end: 0),
              verticalSpaceMedium,
              Align(
                alignment: Alignment.centerLeft,
                child: text_helper(
                  data: "Email Address",
                ).animate(delay: 700.ms).fade().moveY(begin: 100, end: 0),
              ),
              text_view_helper(
                hint: "abc@gmail.com",
                controller: viewModel.email,
                prefix: const Icon(Icons.mail_outline),
              ).animate(delay: 900.ms).fade().moveY(begin: 100, end: 0),
              verticalSpaceSmall,
              button_helper(
                  onpress: () => viewModel.forgetpassword(context),
                  width: screenWidth(context),
                  child: text_helper(
                    data: "Forget Password",
                    fontWeight: FontWeight.bold,
                    size: fontSize16,
                  )).animate(delay: 1500.ms).fade().moveY(begin: 100, end: 0),
              verticalSpaceSmall,
              InkWell(
                  onTap: () => viewModel.login(context),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      text_helper(
                        data: "Back to ",
                        size: fontSize12,
                      ),
                      text_helper(
                          data: "Login",
                          color: primary,
                          size: fontSize12),
                    ],
                  )).animate(delay: 1700.ms).fade().moveY(begin: 100, end: 0),
            ],
          ),
        )));
  }

  @override
  ForgetpassViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ForgetpassViewModel();
}
