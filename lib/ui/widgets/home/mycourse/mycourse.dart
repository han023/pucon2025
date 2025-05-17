import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pucon2025/ui/common/constants/app_strings.dart';
import 'package:pucon2025/ui/common/customwidget/text_helper.dart';
import 'package:stacked/stacked.dart';

import '../../../../model/CourseModel.dart';
import '../../../common/constants/app_colors.dart';
import '../../../common/constants/helper_functions.dart';
import '../../../common/constants/ui_helpers.dart';
import '../browse/views/author.dart';
import '../browse/views/listview/recommended_view.dart';
import 'my_course_auth.dart';
import 'mycourse_model.dart';

class Mycourse extends StackedView<MycourseModel> {
  const Mycourse({super.key});

  @override
  Widget builder(
    BuildContext context,
    MycourseModel viewModel,
    Widget? child,
  ) {
    return Padding(
      padding: const EdgeInsets.all(padding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: softGrey,
                    borderRadius: BorderRadius.circular(10),
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
              ),
              InkWell(
                onTap: () => viewModel.cancle(),
                child: text_helper(
                  data: "Cancel",
                  fontWeight: FontWeight.bold,
                  font: sourceserif,
                ),
              )
            ],
          ),
          verticalSpaceSmall,
          text_helper(
              data: "Top Searches",
              size: fontSize20,
              fontWeight: FontWeight.bold,
              font: sourceserif),
          verticalSpaceSmall,
          Wrap(
              children: viewModel.topSearch
                  .map((item) => InkWell(
                        onTap: () => viewModel.addSearch(item),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: softGrey,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: text_helper(data: item),
                        ),
                      ))
                  .toList()),
          verticalSpaceSmall,
          myCourseAuth(context, viewModel),
          verticalSpaceTiny,
          text_helper(
              data: "Courses",
              size: fontSize20,
              fontWeight: FontWeight.bold,
              font: sourceserif),
          verticalSpaceSmall,
          Expanded(
            child: FirestoreListView<Map<String, dynamic>>(
              query: viewModel.course.firestore,
              shrinkWrap: true,
              primary: false,
              loadingBuilder: (context) =>
                  Center(child: displaysimpleprogress(context)),
              itemBuilder: (context, snapshot) {
                final data = snapshot.data();
                final course = CourseModel.fromMap(data);

                return Container(
                  width: screenWidthCustom(context, 0.7),
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: course.courseImage,
                          imageBuilder: (context, imageProvider) => Container(
                            width: screenWidthCustom(context, 0.2),
                            height: screenWidthCustom(context, 0.2),
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
                      horizontalSpaceSmall,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text_helper(
                              data: course.title,
                              font: sourceserif,
                              size: fontSize12),
                          verticalSpaceMedium,
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
                          Container(
                            width: 200,
                            height: 2,
                            color: softGrey,
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  MycourseModel viewModelBuilder(
    BuildContext context,
  ) =>
      MycourseModel();
}
