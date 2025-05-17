import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pucon2025/model/Author.dart';
import 'package:pucon2025/ui/common/constants/helper_functions.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:pucon2025/ui/widgets/home/browse/views/common/heading.dart';
import 'package:pucon2025/ui/widgets/home/mycourse/mycourse_model.dart';

import '../../../common/constants/app_strings.dart';
import '../../../common/constants/ui_helpers.dart';
import '../../../common/customwidget/image_from_network.dart';
import '../../../common/customwidget/text_helper.dart';

Widget myCourseAuth(BuildContext context, MycourseModel viewModel) {
  return Column(
    children: [
      HeadingBrowse("Top Authors"),
      SizedBox(
        height: 105,
        child: FirestoreListView<Map<String, dynamic>>(
          query: viewModel.author.firestore,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          primary: false,
          loadingBuilder: (context) =>
              Center(child: displaysimpleprogress(context)),
          itemBuilder: (context, snapshot) {
            final data = snapshot.data();
            final author = Author.fromMap(data);

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
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
