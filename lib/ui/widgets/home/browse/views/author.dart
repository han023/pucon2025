import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pucon2025/model/Author.dart';
import 'package:pucon2025/ui/common/constants/app_colors.dart';
import 'package:pucon2025/ui/common/constants/app_strings.dart';
import 'package:pucon2025/ui/common/constants/helper_functions.dart';
import 'package:pucon2025/ui/common/constants/ui_helpers.dart';
import 'package:pucon2025/ui/common/customwidget/text_helper.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:pucon2025/ui/widgets/home/browse/views/author/autorview.dart';
import 'package:pucon2025/ui/widgets/home/browse/views/common/heading.dart';

import '../browse_model.dart';

Widget author(BuildContext context, BrowseModel viewModel) {
  return Column(
    children: [
      HeadingBrowse("Top Authors"),
      SizedBox(
        height: 70,
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

            return AuthorView(context, viewModel, author);
          },
        ),
      ),
    ],
  );
}
