import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'browse_model.dart';

class Browse extends StackedView<BrowseModel> {
  const Browse({super.key});

  @override
  Widget builder(
    BuildContext context,
    BrowseModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  BrowseModel viewModelBuilder(
    BuildContext context,
  ) =>
      BrowseModel();
}
