import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'account_model.dart';

class Account extends StackedView<AccountModel> {
  const Account({super.key});

  @override
  Widget builder(
    BuildContext context,
    AccountModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  AccountModel viewModelBuilder(
    BuildContext context,
  ) =>
      AccountModel();
}
