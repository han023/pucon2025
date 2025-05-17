import 'package:flutter/material.dart';
import 'package:pucon2025/ui/views/auth/signup/signup_after_verify.dart';
import 'package:pucon2025/ui/views/auth/signup/signup_before_verify.dart';
import 'package:pucon2025/ui/views/auth/signup/signup_top.dart';
import 'package:stacked/stacked.dart';

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
          child: Column(
            children: [
              signupTop(context),
              viewModel.verify
                  ? signupAfterVerify(context, viewModel)
                  : signupBeforeVerify(context, viewModel),
            ],
          ),
        ));
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
