
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pucon2025/ui/widgets/home/browse/views/common/heading.dart';

import '../../../../../model/CourseModel.dart';
import '../../../../common/constants/helper_functions.dart';
import '../browse_model.dart';
import 'listview/recommended_view.dart';

Widget RecommendedCourse(BuildContext context, BrowseModel viewModel){
  return Column(
    children: [
      HeadingBrowse("Recommended course"),
      SizedBox(
        height: 250,
        child: FirestoreListView<Map<String, dynamic>>(
          query: viewModel.course.firestore,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          primary: false,
          loadingBuilder: (context) =>
              Center(child: displaysimpleprogress(context)),
          itemBuilder: (context, snapshot) {
            final data = snapshot.data();
            final course = CourseModel.fromMap(data);

            return recommendedView(context, viewModel, course);
          },
        ),
      ),
    ],
  );
}