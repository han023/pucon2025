import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'notifications_model.dart';

class Notifications extends StackedView<NotificationsModel> {
  const Notifications({super.key});

  @override
  Widget builder(
    BuildContext context,
    NotificationsModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  NotificationsModel viewModelBuilder(
    BuildContext context,
  ) =>
      NotificationsModel();
}
