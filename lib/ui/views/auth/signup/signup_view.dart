import 'package:flutter/material.dart';
import 'package:pucon2025/ui/views/auth/signup/signup_after_verify.dart';
import 'package:pucon2025/ui/views/auth/signup/signup_before_verify.dart';
import 'package:pucon2025/ui/views/auth/signup/signup_bottom.dart';
import 'package:pucon2025/ui/views/auth/signup/signup_top.dart';
import 'package:stacked/stacked.dart';

import '../../../common/constants/ui_helpers.dart';
import 'signup_viewmodel.dart';

class SignupView extends StackedView<SignupViewModel> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                signupTop(context),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(
                        bottom: 100), // Padding to avoid overlapping
                    child: Column(
                      children: [
                        viewModel.verify
                            ? signupAfterVerify(context, viewModel)
                            : signupBeforeVerify(context, viewModel),
                        verticalSpaceMedium,
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: signupBottom(context, viewModel),
            )
          ],
        ),
      ),
    );
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
