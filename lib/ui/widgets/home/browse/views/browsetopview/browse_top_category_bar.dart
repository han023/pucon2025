
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pucon2025/ui/widgets/home/browse/browse_model.dart';

import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/app_strings.dart';
import '../../../../../common/constants/ui_helpers.dart';
import '../../../../../common/customwidget/text_helper.dart';

Widget BrowseTopCategoryBar(BuildContext context, BrowseModel viewModel){
  return SizedBox(
    width: screenWidth(context),
    height: 30,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: viewModel.categories
          .map((item) => Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: padding10),
        child: InkWell(
          onTap: () => viewModel.updateCategory(item),
          child: Column(
            children: [
              text_helper(
                data: item,
                color: viewModel.selectedCategory == item
                    ? white
                    : grey,
                font: sourceserif,
                size: fontSize12,
              ),
              verticalSpaceTiny,
              viewModel.selectedCategory == item
                  ? Container(
                width: 60,
                height: 2,
                color: white,
              )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ))
          .toList(),
    ),
  );
}