import 'package:flutter/material.dart';
import 'package:pucon2025/ui/common/constants/app_colors.dart';
import 'package:pucon2025/ui/common/constants/app_strings.dart';
import 'package:pucon2025/ui/common/constants/ui_helpers.dart';
import 'package:pucon2025/ui/common/customwidget/text_helper.dart';
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
    return Padding(
      padding: const EdgeInsets.all(padding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          text_helper(
            data: "Bookmarks",
            font: sourceserif,
            fontWeight: FontWeight.bold,
            size: fontSize20,
          ),
          verticalSpaceSmall,
          Row(
            children: [

            ],
          ),
          Container(
            width: screenWidth(context),
            height: 2,
            color: softGrey,
          ),

        ],
      ),
    );
  }

  @override
  BookmarkModel viewModelBuilder(
    BuildContext context,
  ) =>
      BookmarkModel();
}
