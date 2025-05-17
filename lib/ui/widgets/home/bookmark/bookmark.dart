import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
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
          verticalSpaceMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const Icon(Iconsax.sort),
                  text_helper(
                    data: "Sort",
                    font: sourceserif,
                  )
                ],
              ),
              Container(
                height: 20,
                width: 2,
                color: softGrey,
              ),
              Row(
                children: [
                  const Icon(Iconsax.filter),
                  text_helper(
                    data: "Filter",
                    font: sourceserif,
                  )
                ],
              ),
            ],
          ),
          verticalSpaceSmall,
          Container(
            width: screenWidth(context),
            height: 2,
            color: softGrey,
          ),
          verticalSpaceMedium,

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
