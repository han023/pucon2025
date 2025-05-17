import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stacked/stacked.dart';
import 'package:iconsax/iconsax.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_strings.dart';
import '../../../common/constants/ui_helpers.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/customwidget/text_view_helper.dart';
import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            verticalSpaceLarge,
            text_helper(
              data: "Let's Sign you in",
              font: montserrat,
              fontWeight: FontWeight.bold,
              size: fontSize20,
            ).animate(delay: 500.ms).fade().moveY(begin: 100, end: 0),
            text_helper(
              data: "Please sign in to access your account and find a doctor.",
              font: montserrat,
              textAlign: TextAlign.start,
            ).animate(delay: 700.ms).fade().moveY(begin: 100, end: 0),
            verticalSpaceMedium,
            Align(
              alignment: Alignment.centerLeft,
              child: text_helper(
                data: "Email Address",
                font: montserrat,
              ).animate(delay: 700.ms).fade().moveY(begin: 100, end: 0),
            ),
            text_view_helper(
              hint: "abc@gmail.com",
              controller: viewModel.email,
              prefix: const Icon(Icons.mail_outline),
            ).animate(delay: 900.ms).fade().moveY(begin: 100, end: 0),
            Align(
              alignment: Alignment.centerLeft,
              child: text_helper(
                data: "Password",
                font: montserrat,
              ).animate(delay: 700.ms).fade().moveY(begin: 100, end: 0),
            ),
            text_view_helper(
              hint: "123@Abcd",
              controller: viewModel.password,
              obsecure: viewModel.obsure,
              maxline: 1,
              suffix: InkWell(
                onTap: () => viewModel.toggle(),
                child: Icon(viewModel.obsure ? Iconsax.eye_slash : Iconsax.eye),
              ),
              prefix: const Icon(Iconsax.password_check),
            ).animate(delay: 1100.ms).fade().moveY(begin: 100, end: 0),
            button_helper(
                onpress: () => viewModel.login(context),
                width: screenWidth(context),
                child: text_helper(
                  data: "Login",
                  font: nunito,
                  fontWeight: FontWeight.bold,
                  color: white,
                  size: fontSize16,
                )).animate(delay: 1500.ms).fade().moveY(begin: 100, end: 0),
            verticalSpaceSmall,
            InkWell(
                onTap: () => viewModel.signup(context),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text_helper(
                      data: "Don't have an account? ",
                      font: poppins,
                      size: fontSize12,
                    ),
                    text_helper(
                        data: "Sign Up",
                        font: poppins,
                        color: primary,
                        size: fontSize12),
                  ],
                )).animate(delay: 1700.ms).fade().moveY(begin: 100, end: 0),
            verticalSpaceMedium,
          ],
        ),
      ),
    ));
  }

  Future<void> permission() async {
    await Permission.notification.request();
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    permission();
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
