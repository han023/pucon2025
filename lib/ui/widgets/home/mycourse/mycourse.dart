import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'mycourse_model.dart';

class Mycourse extends StackedView<MycourseModel> {
  const Mycourse({super.key});

  @override
  Widget builder(
    BuildContext context,
    MycourseModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  MycourseModel viewModelBuilder(
    BuildContext context,
  ) =>
      MycourseModel();
}
