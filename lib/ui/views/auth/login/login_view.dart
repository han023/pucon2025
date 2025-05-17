import 'package:flutter/material.dart';
import 'package:pucon2025/ui/views/auth/login/login_middel.dart';
import 'package:pucon2025/ui/views/auth/login/login_top.dart';
import 'package:stacked/stacked.dart';
import 'package:permission_handler/permission_handler.dart';

import 'login_bottom.dart';
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
      child: Column(
        children: [
          LoginTop(context),
          loginMiddel(context, viewModel),
          loginBottom(context, viewModel),
        ],
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
