import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pucon2025/model/Author.dart';
import 'package:pucon2025/ui/common/constants/app_strings.dart';
import 'package:pucon2025/ui/common/constants/ui_helpers.dart';
import 'package:pucon2025/ui/common/customwidget/text_helper.dart';

import '../../../../../../model/CourseModel.dart';
import '../../../../../common/constants/helper_functions.dart';
import '../../../../../common/customwidget/image_from_network.dart';
import '../../browse_model.dart';

Widget recommendedView(
    BuildContext context, BrowseModel viewModel, CourseModel course) {
  return Container(
    width: screenWidthCustom(context, 0.7),
    alignment: Alignment.center,
    margin: const EdgeInsets.symmetric(horizontal: 8),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: course.courseImage,
            imageBuilder: (context, imageProvider) => Container(
              width: screenWidthCustom(context, 0.7),
              height: screenWidthCustom(context, 0.4),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => displaysimpleprogress(context),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
            ),
          ),
        ),
        verticalSpaceSmall,
        Row(
          children: [
            text_helper(
                data: "${course.durationHours}h 0s",
                font: sourceserif,
                size: fontSize12),
            horizontalSpaceTiny,
            text_helper(data: "7 Lessons", font: sourceserif, size: fontSize12),
            horizontalSpaceTiny,
            const Icon(Icons.star, color: Colors.orange),
            text_helper(
              data: course.rating,
              font: sourceserif,
              size: fontSize12,
            ),
          ],
        ),
        verticalSpaceSmall,
        FutureBuilder(
          future: viewModel.author.getAuthor(course.authorId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.toString() == '[]') {
                return const SizedBox.shrink();
              } else {
                Author author = snapshot.data;
                return Row(
                  children: [
                    showImageFromNetwork(author.authorImage),
                    horizontalSpaceSmall,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        text_helper(
                          data: author.name,
                          font: sourceserif,
                          size: fontSize12,
                          fontWeight: FontWeight.bold,
                        ),
                        text_helper(
                          data: course.category,
                          font: sourceserif,
                          size: fontSize10,
                        ),
                      ],
                    )
                  ],
                );
              }
            } else if (snapshot.hasError) {
              return const Icon(
                Icons.error,
              );
            } else {
              return displaysimpleprogress(context);
            }
          },
        ),
      ],
    ),
  );
}
