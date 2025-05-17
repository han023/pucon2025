import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'bookmark_model.dart';

class Bookmark extends StackedView<BookmarkModel> {
  const Bookmark({super.key});

  @override
  Widget builder(
    BuildContext context,
    BookmarkModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  BookmarkModel viewModelBuilder(
    BuildContext context,
  ) =>
      BookmarkModel();
}
