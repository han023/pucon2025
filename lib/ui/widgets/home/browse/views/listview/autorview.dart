import 'package:flutter/material.dart';
import 'package:pucon2025/model/Author.dart';
import 'package:pucon2025/ui/common/constants/app_colors.dart';
import 'package:pucon2025/ui/common/constants/app_strings.dart';
import 'package:pucon2025/ui/common/constants/ui_helpers.dart';
import 'package:pucon2025/ui/common/customwidget/image_from_network.dart';
import 'package:pucon2025/ui/common/customwidget/text_helper.dart';
import 'package:pucon2025/ui/widgets/home/browse/browse_model.dart';


Widget AuthorView(BuildContext context, BrowseModel viewModel, Author author) {
  return Container(
    width: 70,
    alignment: Alignment.center,
    margin: const EdgeInsets.symmetric(horizontal: 8),
    child: Column(
      children: [
        showImageFromNetwork(author.authorImage),
        text_helper(
          data: author.name,
          font: sourceserif,
          size: fontSize10,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.bold,
        ),
        verticalSpaceSmall,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.video_collection,
              color: grey,
              size: 15,
            ),
            horizontalSpaceTiny,
            text_helper(
              data: "27",
              font: sourceserif,
              size: fontSize10,
              fontWeight: FontWeight.bold,
            ),
          ],
        )
      ],
    ),
  );
}
