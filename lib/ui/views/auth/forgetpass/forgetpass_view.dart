import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pucon2025/ui/views/auth/forgetpass/forgot_email.dart';
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
        appBar: AppBar(
          leading: InkWell(
              onTap: () => viewModel.back(),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 25,
              )),
          title: text_helper(
              data: "Forget Password",
              font: sourceserif,
              fontWeight: FontWeight.bold),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              text_helper(
                data:
                    "Enter your email and will send you\ninstruction on how to reset it",
                font: sourceserif,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                size: fontSize12,
              ).animate(delay: 500.ms).fade().moveY(begin: 100, end: 0),
              verticalSpaceMedium,
              forgotEmail(context, viewModel)
                  .animate(delay: 700.ms)
                  .fade()
                  .moveY(begin: 100, end: 0),
              verticalSpaceSmall,
              button_helper(
                  onpress: () => viewModel.forgetpassword(context),
                  width: screenWidth(context),
                  child: text_helper(
                    data: "Send",
                    fontWeight: FontWeight.bold,
                    color: white,
                    font: sourceserif,
                  )).animate(delay: 900.ms).fade().moveY(begin: 100, end: 0),
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
