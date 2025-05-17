import 'package:flutter/material.dart';
import 'package:pucon2025/ui/common/constants/app_colors.dart';
import 'package:pucon2025/ui/common/constants/ui_helpers.dart';
import 'package:pucon2025/ui/widgets/home/browse/browse_model.dart';

import 'browsetopview/browse_top_category_bar.dart';
import 'browsetopview/browse_top_slide_show.dart';

Widget browseTop(BuildContext context, BrowseModel viewModel) {
  return Container(
    width: screenWidth(context),
    color: primary,
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0B3BBB),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: primaryLight),
          ),
          child: TextFormField(
            controller: viewModel.search,
            decoration: const InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(color: grey),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Icon(Icons.search, color: grey),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 12),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              isDense: true,
            ),
            style: const TextStyle(color: white),
          ),
        ),
        verticalSpaceSmall,
        BrowseTopCategoryBar(context,viewModel),
        verticalSpaceSmall,
        BrowseTopSlideShow(context),
      ],
    ),
  );
}
